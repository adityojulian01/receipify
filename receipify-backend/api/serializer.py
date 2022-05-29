from rest_framework.serializers import ModelSerializer
from .models import Items, ReceiptLibrary
from django.contrib.auth.models import User
from rest_framework import serializers

class ItemsSerializer(ModelSerializer):
    class Meta:
        model = Items
        fields = '__all__'
        
class UserSerializer(ModelSerializer):
    class Meta:
        model = User
        fields = ['id', 'username', 'email']

class ReceiptSerializer(serializers.ModelSerializer):
    class Meta:
        model = ReceiptLibrary
        fields = '__all__'

def serialize_user(user):
    usr = {
        "id": user.id,
        "username": user.username,
        "email": user.email
    }

    return usr