from django.urls import path
from . import views

urlpatterns = [
    path('', views.VideoList.as_view(), name='video-list'),
    path('<int:pk>/', views.VideoDetail.as_view(), name='video-detail')
    # path('upload/', views.VideoUpload.as_view(), name='video-upload')
]
