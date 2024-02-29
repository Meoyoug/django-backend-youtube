from django.contrib import admin
from django.urls import path, include
from drf_spectacular.views import (
    SpectacularAPIView, SpectacularRedocView, SpectacularSwaggerView
)
urlpatterns = [
    path('admin/', admin.site.urls),
    path(
        'api/v1/schema',
        SpectacularAPIView.as_view(),
        name='schema'),
    path(
        'api/v1/swagger-ui/',
        SpectacularSwaggerView.as_view(url_name='schema'),
        name='swagger-ui'),
    path(
        'api/v1/redoc/',
        SpectacularRedocView.as_view(url_name='schema'),
        name='redoc'),
    path('api/v1/videos/', include('videos.urls')),
    path("chat/", include("chat.urls")),
    path('api/v1/subscriptions/', include('subscriptions.urls')),
]
