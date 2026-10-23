import json
from datetime import timedelta

from django.contrib.auth import get_user_model
from django.utils import timezone
from rest_framework import viewsets, permissions, status
from rest_framework.decorators import action
from rest_framework.response import Response
from rest_framework.parsers import MultiPartParser, FormParser
from rest_framework_simplejwt.views import TokenObtainPairView

from .models import (
    Laboratory, Reservation, FaceProfile, CheckinTask, AttendanceRecord,
)
from .serializers import UserSerializer, LaboratorySerializer, ReservationSerializer, CheckinTaskSerializer
from .services import FaceRecognitionService

User = get_user_model()


class LoginView(TokenObtainPairView):

    pass


class UserViewSet(viewsets.ReadOnlyModelViewSet):
    serializer_class = UserSerializer
    permission_classes = [permissions.IsAuthenticated]

    def get_queryset(self):
        return User.objects.all()

    @action(detail=False, methods=['get'])
    def me(self, request):
        serializer = self.get_serializer(request.user)
        return Response(serializer.data)


class LaboratoryViewSet(viewsets.ModelViewSet):
    queryset = Laboratory.objects.all()
    serializer_class = LaboratorySerializer
    permission_classes = [permissions.IsAuthenticated]


class ReservationViewSet(viewsets.ModelViewSet):
    serializer_class = ReservationSerializer
    permission_classes = [permissions.IsAuthenticated]

    def get_queryset(self):
        user = self.request.user
        if user.role in ['admin', 'lab_admin']:
            return Reservation.objects.all()
        return Reservation.objects.filter(applicant=user)

    def perform_create(self, serializer):
        serializer.save(applicant=self.request.user)


class FaceViewSet(viewsets.ViewSet):
    permission_classes = [permissions.IsAuthenticated]
    parser_classes = (MultiPartParser, FormParser)

    @action(detail=False, methods=['post'], url_path='enroll')
    def enroll(self, request):
        image_file = request.FILES.get('image')
        if not image_file:
            return Response({'error': '请上传图片'}, status=status.HTTP_400_BAD_REQUEST)

        try:
            encoding = FaceRecognitionService.extract_face_encoding(image_file)
            profile, _ = FaceProfile.objects.update_or_create(
                user=request.user,
                defaults={
                    'face_token': json.dumps(encoding),
                    'status': 'active',
                },
            )
            return Response({'message': '人脸绑定成功', 'status': profile.status})
        except ValueError as e:
            return Response({'error': str(e)}, status=status.HTTP_400_BAD_REQUEST)


class CheckinTaskViewSet(viewsets.ModelViewSet):
    permission_classes = [permissions.IsAuthenticated]
    queryset = CheckinTask.objects.all()
    serializer_class = CheckinTaskSerializer

    def get_queryset(self):
        user = self.request.user
        if user.role == 'teacher':
            return CheckinTask.objects.filter(activity__teacher=user)
        return CheckinTask.objects.all()

    @action(detail=True, methods=['post'], url_path='verify')
    def verify(self, request, pk=None):
        task = self.get_object()
        now = timezone.now()
        student = request.user

        if now < task.start_time:
            return Response({'error': '签到尚未开始'}, status=status.HTTP_400_BAD_REQUEST)
        if now > task.end_time:
            return Response({'error': '签到已结束'}, status=status.HTTP_400_BAD_REQUEST)

        if not task.activity.course_members.filter(student=student).exists():
            return Response({'error': '您不在该课程的学生名单中'}, status=status.HTTP_403_FORBIDDEN)

        if AttendanceRecord.objects.filter(task=task, student=student).exists():
            record = AttendanceRecord.objects.get(task=task, student=student)
            return Response({
                'message': '您已经签到过了',
                'time': record.checkin_time,
                'status': record.attendance_status,
            }, status=status.HTTP_200_OK)

        image_file = request.FILES.get('image')
        if not image_file:
            return Response({'error': '请上传现场照片'}, status=status.HTTP_400_BAD_REQUEST)

        try:
            profile = student.face_profile
            known_encoding = json.loads(profile.face_token)
        except FaceProfile.DoesNotExist:
            return Response({'error': '您还没有绑定人脸，请先绑定'}, status=status.HTTP_400_BAD_REQUEST)

        try:
            verified, distance = FaceRecognitionService.verify_face(known_encoding, image_file)
        except ValueError as e:
            return Response({'error': str(e)}, status=status.HTTP_400_BAD_REQUEST)

        if not verified:
            return Response({
                'error': '人脸核验失败，请重试',
                'distance': distance,
            }, status=status.HTTP_400_BAD_REQUEST)

        late_time = task.start_time + timedelta(minutes=task.late_threshold_minutes)
        att_status = 'late' if now > late_time else 'normal'

        record = AttendanceRecord.objects.create(
            task=task,
            student=student,
            verify_result=True,
            verify_score=1.0 - distance,
            attendance_status=att_status,
        )

        return Response({
            'message': '签到成功',
            'status': att_status,
            'time': record.checkin_time,
        }, status=status.HTTP_201_CREATED)


from .models import Equipment, EquipmentUse, RecognitionRecord, OperationLog
from datetime import date

class DashboardViewSet(viewsets.ViewSet):
    permission_classes = [permissions.IsAuthenticated]

    @action(detail=False, methods=['get'])
    def summary(self, request):
        today = timezone.now().date()
        today_start = timezone.make_aware(
            timezone.datetime.combine(today, timezone.datetime.min.time())
        )
        today_end = today_start + timedelta(days=1)
        today_reservations = Reservation.objects.filter(
            start_time__lt=today_end, end_time__gt=today_start
        ).count()

        today_attendance = AttendanceRecord.objects.filter(
            checkin_time__gte=today_start, checkin_time__lt=today_end
        ).count()

        today_late = AttendanceRecord.objects.filter(
            checkin_time__gte=today_start, checkin_time__lt=today_end,
            attendance_status='late'
        ).count()

        active_labs = Laboratory.objects.filter(status='open').count()

        chart_7d = []
        for i in range(6, -1, -1):
            day = today - timedelta(days=i)
            day_start = timezone.make_aware(
                timezone.datetime.combine(day, timezone.datetime.min.time())
            )
            day_end = day_start + timedelta(days=1)
            count = AttendanceRecord.objects.filter(
                checkin_time__gte=day_start, checkin_time__lt=day_end
            ).count()
            chart_7d.append({'date': day.strftime('%m-%d'), 'count': count})

        status_dist = {
            'normal': AttendanceRecord.objects.filter(attendance_status='normal').count(),
            'late': AttendanceRecord.objects.filter(attendance_status='late').count(),
        }

        return Response({
            'metrics': {
                'today_reservations': today_reservations,
                'today_attendance': today_attendance,
                'today_late': today_late,
                'active_labs': active_labs,
            },
            'chart_7d': chart_7d,
            'status_distribution': status_dist,
        })


class AttendanceViewSet(viewsets.ReadOnlyModelViewSet):
    permission_classes = [permissions.IsAuthenticated]
    queryset = AttendanceRecord.objects.select_related('student', 'task__activity')

    def get_serializer_class(self):
        from rest_framework import serializers as s

        class ARSerializer(s.ModelSerializer):
            student_name = s.CharField(source='student.username', read_only=True)
            activity_name = s.CharField(source='task.activity.name', read_only=True)

            class Meta:
                model = AttendanceRecord
                fields = '__all__'

        return ARSerializer