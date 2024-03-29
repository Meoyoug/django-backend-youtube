# Generated by Django 5.0.2 on 2024-02-28 02:42

import django.db.models.deletion
from django.conf import settings
from django.db import migrations, models


class Migration(migrations.Migration):

    initial = True

    dependencies = [
        ('videos', '0001_initial'),
        migrations.swappable_dependency(settings.AUTH_USER_MODEL),
    ]

    operations = [
        migrations.CreateModel(
            name='Reaction',
            fields=[
                ('id', models.BigAutoField(auto_created=True, primary_key=True, serialize=False, verbose_name='ID')),
                ('created_at', models.DateTimeField(auto_now_add=True)),
                ('updated_at', models.DateTimeField(auto_now=True)),
                ('like', models.BooleanField(default=False)),
                ('dislike', models.BooleanField(default=False)),
                ('reaction', models.IntegerField(choices=[('LIKE', 'Like'), ('DISLIKE', 'Dislike'), ('NO_REACTION', 'No Reaction')], default=0)),
                ('user', models.ForeignKey(on_delete=django.db.models.deletion.CASCADE, to=settings.AUTH_USER_MODEL)),
                ('video', models.ForeignKey(on_delete=django.db.models.deletion.CASCADE, to='videos.video')),
            ],
            options={
                'abstract': False,
            },
        ),
    ]
