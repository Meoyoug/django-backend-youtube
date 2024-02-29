from django.db import models
from common.models import CommonModel
from users.models import User


class Subscription(CommonModel):
    subscriber = models.ForeignKey(
        User,
        related_name='subscriptions',
        on_delete=models.CASCADE
    )
    subscribed_to = models.ForeignKey(
        User,
        related_name='subscribers',
        on_delete=models.CASCADE
    )
