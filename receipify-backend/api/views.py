# from email import message
# import json
import imp
from django.http import JsonResponse
from rest_framework.decorators import api_view, permission_classes
from rest_framework.permissions import IsAuthenticated
from rest_framework.response import Response
from .serializer import ItemsSerializer, ReceiptSerializer, UserSerializer
from .models import Items, ReceiptExtraction, ReceiptLibrary
from django.contrib.auth.models import User
from django.contrib.auth import authenticate, login
# from rest_framework import status
from rest_framework.parsers import MultiPartParser, FormParser
from rest_framework.views import APIView
from rest_framework_simplejwt.serializers import TokenObtainPairSerializer
from rest_framework_simplejwt.views import TokenObtainPairView

# from flask import request
from PIL import Image
# import io
import numpy as np
from .extract_receipt import *

# from flask import Flask, request, Response
# app = Flask(__name__)
import jsonpickle
import numpy as np
import cv2
import base64

# from superapp.api import serializer

@api_view(['GET', 'POST', 'PUT'])
def getRoutes(request):
    routes = [
        {
            'Endpoint': '/items/',
            'method': 'GET',
            'body': None,
            'description': 'Return an array of items'
        },
        {
            'Endpoint': '/items/id/',
            'method': 'GET',
            'body': None,
            'description': 'Return single object of items'
        },
        {
            'Endpoint': '/items/create/',
            'method': 'POST',
            'body': {'body': ""},
            'description': 'Creates new note with data sent in post request'
        },
        {
            'Endpoint': '/items/id/update/',
            'method': 'PATCH',
            'body': {'body': ""},
            'description': 'Update existing item'
        },
        {
            'Endpoint': '/items/id/delete/',
            'method': 'DELETE',
            'body': None,
            'description': 'Delete existing item'
        },
        {
            'Endpoint': '/users/register/',
            'method': 'POST',
            'body': None,
            'description': 'Create new user'            
        },
        {
            'Endpoint': '/users/login/',
            'method': 'POST',
            'body': None,
            'description': 'Login to existing account'            
        },
        {
            'Endpoint': '/receipt/id/upload/',
            'method': 'POST',
            'body': None,
            'description': 'Upload receipt image of a user'            
        },
        {
            'Endpoint': '/receipt/id/',
            'method': 'POST',
            'body': None,
            'description': 'Check receipt of a specific user'            
        },
        {
            'Endpoint': '/token/',
            'method': 'POST',
            'body': None,
            'description': 'Login and retrieve token'            
        },
        {
            'Endpoint': '/token/refresh/',
            'method': 'POST',
            'body': None,
            'description': 'Renew access token'            
        },
        {
            'Endpoint': '/extract/',
            'method': 'POST',
            'body': None,
            'description': 'Retrieve user receipt and extract the items using OCR'            
        },
    ]
    return Response(routes)

@api_view(['GET'])
def getItems(request):
    items = Items.objects.all()
    serializer = ItemsSerializer(items, many = True)
    return Response(serializer.data)

@api_view(['GET'])
@permission_classes([IsAuthenticated])
def getItemsWithID(request, pk):
    item = Items.objects.get(userID=pk)
    serializer = ItemsSerializer(item, many = False)
    return Response(serializer.data)

@api_view(['POST'])
def createItem(request):
    data = request.data
    
    item = Items.objects.create(
        userID = data['userID'],
        body = data['body']
    )
    serializer = ItemsSerializer(item, many = False)
    return Response(serializer.data)

@api_view(['PATCH'])
@permission_classes([IsAuthenticated])
def updateItem(request, pk):
    data = request.data

    item = Items.objects.get(userID=pk)
    serializer = ItemsSerializer(item, data = request.data, partial = True)
    if serializer.is_valid():
        serializer.save()
    
    return Response(serializer.data)

@api_view(['DELETE'])
def deleteItem(request, pk):
    item = Items.objects.get(userID=pk)
    item.delete()
    return Response('Note was deleted!')

@api_view(['POST'])
def registerUser(request):
    data = request.data
    user = User.objects.create_user(
        username = data['username'],
        password = data['password'],
        email = data['email']
    )
    
    if user is not None:
        login(request, user)
        serializer = UserSerializer(user, many = False)
        return Response(serializer.data)
    
    return Response("Bad Request")

@api_view(['POST'])
def loginUser(request):
    if request.method == "POST":
        body_received = request.data
        username = body_received["username"]
        user_pass = body_received["password"]

        user = authenticate(request, username=username, password=user_pass)

        if user is not None:
            login(request, user)
            response = UserSerializer(user, many = False)
            return Response(response.data)
        else:
            return Response({"Status": 401, "message": "user not found"})

@api_view(['POST'])
def extractImage(request):
    imageString = base64.b64decode(request.data['image'])
    nparr = np.fromstring(imageString, np.uint8)
    img = cv2.imdecode(nparr, cv2.IMREAD_ANYCOLOR)
    extracted_item = extract_receipt(img)
    return Response(extracted_item)

# @api_view(['POST'])
class ImageUpload(APIView):
    parser_classes = [MultiPartParser, FormParser]
    permission_classes = [IsAuthenticated]
    
    # @api_view(['POST'])
    def post(self, request, pk, format = None):
        if request.method == "POST":
            data = request.data
            receipt = ReceiptLibrary.objects.create(
                userID = pk,
                image = data["image"],
                ingredients = data["ingredients"]
            )
            
            if receipt is not None:
                serializer = ReceiptSerializer(receipt, many = False)
                return Response(serializer.data)
            else:
                return Response({"status": 401, "message": "Failed to upload receipt"})
            
    def get(self, request, pk, format = None):
        receipt = ReceiptLibrary.objects.filter(userID = pk)
        serializer = ReceiptSerializer(receipt, context = {'request': request}, many = True)
        return Response(serializer.data)

class MyTokenObtainPairSerializer(TokenObtainPairSerializer):
    @classmethod
    def get_token(cls, user):
        token = super().get_token(user)

        # Add custom claims
        token['username'] = user.username
        token['email'] = user.email
        # ...

        return token

class MyTokenObtainPairView(TokenObtainPairView):
    serializer_class = MyTokenObtainPairSerializer