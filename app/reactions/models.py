from django.db import models
from common.models import CommonModel
from users.models import User
from videos.models import Video


# 유튜브는 좋아요(like), 싫어요(dislike), 제거(removelike)로 구분
class Reaction(CommonModel):
    user = models.ForeignKey(User, on_delete=models.CASCADE)
    video = models.ForeignKey(Video, on_delete=models.CASCADE)

    LIKE = 1
    DISLIKE = -1
    NO_REACTION = 0

    REACTION_CHOICES = (
        (LIKE, 'Like'),
        (DISLIKE, 'Dislike'),
        (NO_REACTION, 'No Reaction'),
    )

    reaction = models.IntegerField(
        choices=REACTION_CHOICES,
        default=NO_REACTION
    )

    # def removelike(self):
    #     self.reaction = self.NO_REACTION
    #     self.save()

    # def change_like(self, alg):
    #     if alg == 'like':
    #         self.reaction = self.LIKE
    #     else:
    #         self.reaction = self.DISLIKE
    #     self.save()
