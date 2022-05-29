import imp
from django.contrib import admin

# Register your models here.

from .models import Items, ReceiptLibrary
# from django.contrib.auth.models import User

admin.site.register(Items)
admin.site.register(ReceiptLibrary)
# admin.site.register(User)