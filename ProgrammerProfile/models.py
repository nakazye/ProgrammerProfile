from django.db import models
# from social.apps.django_app.default.models import UserSocialAuth

class BasicTwitterInfo(models.Model):
    username = models.TextField()
    userImage = models.TextField()
    userScreenName = models.TextField()
    userDescription = models.TextField()
    lastUpdate = models.DateTimeField()

    def __str__(self):
        return self.username

class UserInfo(models.Model):
    CATEGORY = (('social', 'social'),)
    SUB_CATEGORY = (('github', 'github'),
                    ('stackexchange', 'stackexchange'),)
    target = models.ForeignKey(BasicTwitterInfo, related_name='target')
    category = models.TextField(choices=CATEGORY)
    subcategory = models.TextField(choices=SUB_CATEGORY)
    data = models.TextField()
    update = models.ForeignKey(BasicTwitterInfo, related_name='update')
    
