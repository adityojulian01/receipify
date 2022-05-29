from ast import Try
from django.db import models
from django.forms import ImageField
from django.utils.translation import gettext_lazy as _
# from django.contrib.postgres.fields import ArrayField

# Create your models here.
class Items(models.Model):
    userID = models.IntegerField()
    body = models.TextField(default='')
    updated = models.DateTimeField(auto_now=True)
    created = models.DateTimeField(auto_now_add=True)
    
    def __str__(self):
        return self.body[0:10]
    
    class Meta:
        ordering = ['-updated']

def upload_to(instance, filename):
    return 'images/{filename}'.format(filename=filename)

def upload_to_extract(instace, filename):
    return 'extract/{filename}'.format(filename=filename)

class ReceiptLibrary(models.Model):
    userID = models.IntegerField()
    image = models.ImageField(_("Image"), upload_to = upload_to, blank = True, null = True)
    ingredients = models.TextField(null=True, blank=True)
    created = models.DateTimeField(auto_now_add=True)

class ReceiptExtraction(models.Model):
    ImageFile = models.FileField(upload_to=upload_to_extract, blank=True, null=True)
    
    def __str__(self):
        return self.body
    
    def save(self, *args, **kwargs):
        super(ReceiptExtraction, self).save(*args, **kwargs)