from rest_framework import serializers
from django.contrib.auth import get_user_model
from .models import Laboratory, Reservation, CourseActivity

User = get_user_model()


class UserSerializer(serializers.ModelSerializer):
    role_display = serializers.CharField(source='get_role_display', read_only=True)

    class Meta:
        model = User
        fields = ('id', 'username', 'email', 'role', 'role_display', 'student_id', 'employee_id')


class LaboratorySerializer(serializers.ModelSerializer):
    class Meta:
        model = Laboratory
        fields = '__all__'


class ReservationSerializer(serializers.ModelSerializer):
    applicant_name = serializers.CharField(source='applicant.username', read_only=True)
    laboratory_name = serializers.CharField(source='laboratory.name', read_only=True)

    class Meta:
        model = Reservation
        fields = '__all__'
        read_only_fields = ('status', 'reviewer', 'review_comment', 'reviewed_at')

from .models import CheckinTask, AttendanceRecord

class CheckinTaskSerializer(serializers.ModelSerializer):
    activity_name = serializers.CharField(source='activity.name', read_only=True)
    class Meta:
        model = CheckinTask
        fields = '__all__'

class AttendanceRecordSerializer(serializers.ModelSerializer):
    student_name = serializers.CharField(source='student.username', read_only=True)
    activity_name = serializers.CharField(source='task.activity.name', read_only=True)

    class Meta:
        model = AttendanceRecord
        fields = '__all__'