from django.contrib import admin
from django.urls import path, include
from rest_framework.routers import DefaultRouter
from rest_framework_simplejwt.views import TokenRefreshView
from core.api import LoginView, UserViewSet, LaboratoryViewSet, ReservationViewSet
from core.api import (
    LoginView, UserViewSet, LaboratoryViewSet, ReservationViewSet,
    FaceViewSet, CheckinTaskViewSet, DashboardViewSet, AttendanceViewSet
)

router = DefaultRouter()
router.register(r'users', UserViewSet, basename='user')
router.register(r'labs', LaboratoryViewSet, basename='lab')
router.register(r'reservations', ReservationViewSet, basename='reservation')
router.register(r'face', FaceViewSet, basename='face')
router.register(r'checkin/tasks', CheckinTaskViewSet, basename='checkin-task')
router.register(r'dashboard', DashboardViewSet, basename='dashboard')
router.register(r'attendance', AttendanceViewSet, basename='attendance')

urlpatterns = [
    path('admin/', admin.site.urls),
    
    path('api/auth/login/', LoginView.as_view(), name='token_obtain_pair'),
    path('api/auth/refresh/', TokenRefreshView.as_view(), name='token_refresh'),

    path('api/', include(router.urls)),
]
