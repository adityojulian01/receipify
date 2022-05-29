# Generated by Django 4.0.3 on 2022-05-09 22:30

import api.models
from django.db import migrations, models


class Migration(migrations.Migration):

    dependencies = [
        ('api', '0005_receiptlibrary'),
    ]

    operations = [
        migrations.CreateModel(
            name='ReceiptExtraction',
            fields=[
                ('id', models.BigAutoField(auto_created=True, primary_key=True, serialize=False, verbose_name='ID')),
                ('ImageFile', models.FileField(blank=True, null=True, upload_to=api.models.upload_to_extract)),
            ],
        ),
    ]