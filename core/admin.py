from django.contrib import admin
from django.contrib.auth.admin import UserAdmin
from .models import User, Laboratory, CourseActivity, CourseMember,Reservation, FaceProfile, CheckinTask, AttendanceRecord


@admin.register(User)
class CustomUserAdmin(UserAdmin):
    list_display = ('username', 'role', 'student_id', 'employee_id', 'is_active')
    list_filter = ('role', 'is_active')
    fieldsets = UserAdmin.fieldsets + (
        ('扩展信息', {'fields': ('role', 'student_id', 'employee_id')}),
    )

@admin.register(Laboratory)
class LaboratoryAdmin(admin.ModelAdmin):
    list_display = ('code', 'name', 'location', 'capacity', 'status')
    list_filter = ('status',)
    search_fields = ('code', 'name', 'location')

class CourseMemberInline(admin.TabularInline):
    model = CourseMember
    extra = 1

@admin.register(CourseActivity)
class CourseActivityAdmin(admin.ModelAdmin):
    list_display = ('name', 'teacher', 'start_time', 'end_time')
    list_filter = ('teacher',)
    inlines = [CourseMemberInline]

@admin.register(CourseMember)
class CourseMemberAdmin(admin.ModelAdmin):
    list_display = ('activity', 'student')
    list_filter = ('activity',)

@admin.register(Reservation)
class ReservationAdmin(admin.ModelAdmin):
    list_display = ('laboratory', 'applicant', 'start_time', 'end_time', 'status', 'reviewer')
    list_filter = ('status', 'laboratory')
    search_fields = ('applicant__username', 'purpose')

@admin.register(FaceProfile)
class FaceProfileAdmin(admin.ModelAdmin):
    list_display = ('user', 'status', 'updated_at')
    list_filter = ('status',)
    search_fields = ('user__username', 'user__student_id')

@admin.register(CheckinTask)
class CheckinTaskAdmin(admin.ModelAdmin):
    list_display = ('activity', 'start_time', 'end_time', 'late_threshold_minutes', 'status')
    list_filter = ('status', 'activity')

@admin.register(AttendanceRecord)
class AttendanceRecordAdmin(admin.ModelAdmin):
    list_display = ('task', 'student', 'checkin_time', 'attendance_status', 'verify_result')
    list_filter = ('attendance_status', 'verify_result', 'task')
    search_fields = ('student__username', 'task__activity__name')

from .models import Equipment, EquipmentUse, RecognitionRecord, OperationLog

@admin.register(Equipment)
class EquipmentAdmin(admin.ModelAdmin):
    list_display = ('code', 'name', 'laboratory', 'status')
    list_filter = ('status', 'laboratory')
    search_fields = ('code', 'name')

@admin.register(EquipmentUse)
class EquipmentUseAdmin(admin.ModelAdmin):
    list_display = ('equipment', 'user', 'start_time', 'end_time', 'status')
    list_filter = ('status',)

@admin.register(RecognitionRecord)
class RecognitionRecordAdmin(admin.ModelAdmin):
    list_display = ('user', 'recognition_type', 'success', 'similarity', 'created_at')
    list_filter = ('recognition_type', 'success')

@admin.register(OperationLog)
class OperationLogAdmin(admin.ModelAdmin):
    list_display = ('user', 'module', 'action', 'result', 'created_at')
    list_filter = ('module', 'result')
    search_fields = ('user__username', 'action')