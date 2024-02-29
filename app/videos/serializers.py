# from rest_framework import serializers
from rest_framework.serializers import ModelSerializer
from .models import Video
from users.serializers import UserSerializer
from comments.serializers import CommentSerializer


class VideoSerializer(ModelSerializer):

    user = UserSerializer(read_only=True)
    comment_set = CommentSerializer(read_only=True, many=True)
    # 부모가 자녀를 찾기 위해서 필요한 개념: Reverse Accessor

    class Meta:
        model = Video
        fields = '__all__'  # Video모델의 전체 필드를 보여줘
