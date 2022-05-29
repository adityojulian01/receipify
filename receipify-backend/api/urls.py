from django.urls import path
from . import views
from .views import MyTokenObtainPairView

from rest_framework_simplejwt.views import (
    TokenRefreshView,
)

urlpatterns = [
    path('', views.getRoutes),
    path('items/', views.getItems),
    path('items/create/', views.createItem),
    path('items/<str:pk>/update/', views.updateItem),
    path('items/<str:pk>/', views.getItemsWithID),
    path('items/<str:pk>/delete/', views.deleteItem),
    path('users/register/', views.registerUser), 
    path('users/login/', views.loginUser),
    path('receipt/<str:pk>/upload/', views.ImageUpload.as_view(), name = 'Upload Image'),
    path('receipt/<str:pk>/', views.ImageUpload.as_view(), name = 'Get Receipt'),
    path('token/', MyTokenObtainPairView.as_view(), name='token_obtain_pair'),
    path('token/refresh/', TokenRefreshView.as_view(), name='token_refresh'),
    path('extract/', views.extractImage)
]