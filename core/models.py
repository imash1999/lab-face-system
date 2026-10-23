from django.db import models
from django.contrib.auth.models import AbstractUser
from django.conf import settings


class User(AbstractUser):
    ROLE_CHOICES = [
        ('admin', '系统管理员'),
        ('lab_admin', '实验室管理员'),
        ('teacher', '教师'),
        ('student', '学生'),
    ]
    role = models.CharField(max_length=20, choices=ROLE_CHOICES, default='student', verbose_name='角色')
    student_id = models.CharField(max_length=32, blank=True, null=True, unique=True, verbose_name='学号')
    employee_id = models.CharField(max_length=32, blank=True, null=True, unique=True, verbose_name='工号')
    is_active = models.BooleanField(default=True, verbose_name='启用状态')

    class Meta:
        verbose_name = '用户'
        verbose_name_plural = '用户'

    def __str__(self):
        return f'{self.username} ({self.get_role_display()})'


class Laboratory(models.Model):
    STATUS_CHOICES = [
        ('open', '开放'),
        ('closed', '停用'),
    ]
    code = models.CharField(max_length=50, unique=True, verbose_name='实验室编号')
    name = models.CharField(max_length=100, verbose_name='名称')
    location = models.CharField(max_length=200, verbose_name='位置')
    capacity = models.PositiveIntegerField(verbose_name='容量')
    description = models.TextField(blank=True, null=True, verbose_name='简介')
    status = models.CharField(max_length=20, choices=STATUS_CHOICES, default='open', verbose_name='开放状态')

    class Meta:
        verbose_name = '实验室'
        verbose_name_plural = '实验室'

    def __str__(self):
        return f'{self.code} - {self.name}'


class CourseActivity(models.Model):
    name = models.CharField(max_length=200, verbose_name='课程/活动名称')
    teacher = models.ForeignKey(
        settings.AUTH_USER_MODEL,
        on_delete=models.CASCADE,
        related_name='activities',
        verbose_name='授课教师'
    )
    start_time = models.DateTimeField(verbose_name='开始时间')
    end_time = models.DateTimeField(verbose_name='结束时间')
    description = models.TextField(blank=True, null=True, verbose_name='说明')

    class Meta:
        verbose_name = '课程/实验活动'
        verbose_name_plural = '课程/实验活动'

    def __str__(self):
        return self.name


class CourseMember(models.Model):
    activity = models.ForeignKey(
        CourseActivity, 
        on_delete=models.CASCADE,
        related_name='course_members',  
        verbose_name='活动'
        )
    student = models.ForeignKey(
        settings.AUTH_USER_MODEL,
        on_delete=models.CASCADE,
        related_name='course_memberships',
        verbose_name='学生'
    )

    class Meta:
        verbose_name = '活动学生名单'
        verbose_name_plural = '活动学生名单'
        unique_together = ('activity', 'student')

    def __str__(self):
        return f'{self.activity.name} - {self.student.username}'

class Reservation(models.Model):
    STATUS_CHOICES = [
        ('pending', '待审核'),
        ('approved', '已通过'),
        ('rejected', '已拒绝'),
        ('cancelled', '已取消'),
    ]
    laboratory = models.ForeignKey(Laboratory, on_delete=models.CASCADE, related_name='reservations', verbose_name='实验室')
    applicant = models.ForeignKey(
        settings.AUTH_USER_MODEL, 
        on_delete=models.CASCADE, 
        related_name='reservations', 
        verbose_name='申请人'
    )
    start_time = models.DateTimeField(verbose_name='开始时间')
    end_time = models.DateTimeField(verbose_name='结束时间')
    purpose = models.CharField(max_length=255, verbose_name='用途')
    status = models.CharField(max_length=20, choices=STATUS_CHOICES, default='pending', verbose_name='状态')

    reviewer = models.ForeignKey(
        settings.AUTH_USER_MODEL, 
        on_delete=models.SET_NULL, 
        null=True, blank=True, 
        related_name='reviewed_reservations', 
        verbose_name='审核人'
    )
    review_comment = models.TextField(blank=True, null=True, verbose_name='审核意见')
    reviewed_at = models.DateTimeField(null=True, blank=True, verbose_name='审核时间')

    class Meta:
        verbose_name = '预约申请'
        verbose_name_plural = '预约申请'

    def __str__(self):
        return f'{self.laboratory.name} - {self.start_time.strftime("%Y-%m-%d %H:%M")}'


class FaceProfile(models.Model):
    STATUS_CHOICES = [
        ('active', '有效'),
        ('inactive', '失效'),
    ]
    user = models.OneToOneField(
        settings.AUTH_USER_MODEL, 
        on_delete=models.CASCADE, 
        related_name='face_profile', 
        verbose_name='用户'
    )
    face_token = models.TextField(verbose_name='人脸特征/Token')  # В MVP можно хранить JSON с вектором
    updated_at = models.DateTimeField(auto_now=True, verbose_name='更新时间')
    status = models.CharField(max_length=20, choices=STATUS_CHOICES, default='active', verbose_name='状态')

    class Meta:
        verbose_name = '人脸档案'
        verbose_name_plural = '人脸档案'

    def __str__(self):
        return f'{self.user.username} 的人脸'


class CheckinTask(models.Model):
    STATUS_CHOICES = [
        ('pending', '未开始'),
        ('active', '进行中'),
        ('ended', '已结束'),
    ]
    activity = models.ForeignKey(CourseActivity, on_delete=models.CASCADE, related_name='checkin_tasks', verbose_name='关联活动')
    start_time = models.DateTimeField(verbose_name='开始签到时间')
    end_time = models.DateTimeField(verbose_name='结束签到时间')
    late_threshold_minutes = models.PositiveIntegerField(default=10, verbose_name='迟到阈值(分钟)')
    status = models.CharField(max_length=20, choices=STATUS_CHOICES, default='pending', verbose_name='状态')

    class Meta:
        verbose_name = '签到任务'
        verbose_name_plural = '签到任务'

    def __str__(self):
        return f'{self.activity.name} - 签到任务({self.start_time.strftime("%m-%d %H:%M")})'


class AttendanceRecord(models.Model):
    STATUS_CHOICES = [
        ('normal', '正常'),
        ('late', '迟到'),
        ('absent', '缺勤'),
    ]
    task = models.ForeignKey(CheckinTask, on_delete=models.CASCADE, related_name='attendance_records', verbose_name='签到任务')
    student = models.ForeignKey(
        settings.AUTH_USER_MODEL, 
        on_delete=models.CASCADE, 
        related_name='attendance_records', 
        verbose_name='学生'
    )
    checkin_time = models.DateTimeField(auto_now_add=True, verbose_name='签到时间')
    
    # Результат от FaceRecognitionService
    verify_result = models.BooleanField(default=False, verbose_name='核验结果')
    verify_score = models.FloatField(null=True, blank=True, verbose_name='相似度')
    
    attendance_status = models.CharField(max_length=20, choices=STATUS_CHOICES, default='normal', verbose_name='考勤状态')

    class Meta:
        verbose_name = '签到记录'
        verbose_name_plural = '签到记录'
        unique_together = ('task', 'student')

    def __str__(self):
        return f'{self.student.username} - {self.task.activity.name} ({self.get_attendance_status_display()})'

class Equipment(models.Model):
    STATUS_CHOICES = [
        ('available', '可用'),
        ('in_use', '使用中'),
        ('broken', '故障'),
    ]
    code = models.CharField(max_length=50, unique=True, verbose_name='设备编号')
    name = models.CharField(max_length=100, verbose_name='名称')
    laboratory = models.ForeignKey(
        Laboratory, on_delete=models.CASCADE,
        related_name='equipment', verbose_name='所属实验室'
    )
    status = models.CharField(max_length=20, choices=STATUS_CHOICES, default='available', verbose_name='状态')

    class Meta:
        verbose_name = '设备'
        verbose_name_plural = '设备'

    def __str__(self):
        return f'{self.code} - {self.name}'


class EquipmentUse(models.Model):
    STATUS_CHOICES = [
        ('active', '使用中'),
        ('finished', '已结束'),
    ]
    equipment = models.ForeignKey(
        Equipment, on_delete=models.CASCADE,
        related_name='uses', verbose_name='设备'
    )
    user = models.ForeignKey(
        settings.AUTH_USER_MODEL, on_delete=models.CASCADE,
        related_name='equipment_uses', verbose_name='使用人'
    )
    start_time = models.DateTimeField(auto_now_add=True, verbose_name='开始时间')
    end_time = models.DateTimeField(null=True, blank=True, verbose_name='结束时间')
    status = models.CharField(max_length=20, choices=STATUS_CHOICES, default='active', verbose_name='状态')

    class Meta:
        verbose_name = '设备使用记录'
        verbose_name_plural = '设备使用记录'

    def __str__(self):
        return f'{self.equipment.name} - {self.user.username}'


class RecognitionRecord(models.Model):
    TYPE_CHOICES = [
        ('enroll', '绑定'),
        ('verify', '核验'),
    ]
    user = models.ForeignKey(
        settings.AUTH_USER_MODEL, on_delete=models.CASCADE,
        related_name='recognition_records', verbose_name='用户'
    )
    recognition_type = models.CharField(max_length=20, choices=TYPE_CHOICES, verbose_name='识别类型')
    success = models.BooleanField(default=False, verbose_name='是否成功')
    similarity = models.FloatField(null=True, blank=True, verbose_name='相似度')
    duration_ms = models.PositiveIntegerField(null=True, blank=True, verbose_name='耗时(ms)')
    error_code = models.CharField(max_length=100, blank=True, null=True, verbose_name='错误码')
    created_at = models.DateTimeField(auto_now_add=True, verbose_name='时间')

    class Meta:
        verbose_name = '识别调用记录'
        verbose_name_plural = '识别调用记录'

    def __str__(self):
        return f'{self.user.username} - {self.get_recognition_type_display()} - {"OK" if self.success else "FAIL"}'


class OperationLog(models.Model):
    user = models.ForeignKey(
        settings.AUTH_USER_MODEL, on_delete=models.SET_NULL,
        null=True, blank=True, related_name='operation_logs', verbose_name='用户'
    )
    module = models.CharField(max_length=50, verbose_name='模块')
    action = models.CharField(max_length=100, verbose_name='动作')
    obj_repr = models.CharField(max_length=255, blank=True, null=True, verbose_name='对象')
    result = models.CharField(max_length=20, default='success', verbose_name='结果')
    created_at = models.DateTimeField(auto_now_add=True, verbose_name='时间')

    class Meta:
        verbose_name = '操作日志'
        verbose_name_plural = '操作日志'
        ordering = ['-created_at']

    def __str__(self):
        return f'{self.user} - {self.module}/{self.action}'