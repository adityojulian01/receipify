# Generated by Django 4.0.3 on 2022-05-01 17:20

from django.db import migrations, models


class Migration(migrations.Migration):

    dependencies = [
        ('api', '0001_initial'),
    ]

    operations = [
        migrations.AddField(
            model_name='items',
            name='emailAddress',
            field=models.TextField(default='red@gmail.com'),
            preserve_default=False,
        ),
        migrations.AddField(
            model_name='items',
            name='userName',
            field=models.TextField(default='green@gmail.com'),
            preserve_default=False,
        ),
    ]