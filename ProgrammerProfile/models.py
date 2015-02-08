from django.db import models

class BasicTwitterInfo(models.Model):
    username = models.TextField()
    userImage = models.TextField()
    userScreenName = models.TextField()
    userDescription = models.TextField()
    lastUpdate = models.DateTimeField()

    def __str__(self):
        return self.username

class UserInfo(models.Model):

    target = models.ForeignKey(BasicTwitterInfo, related_name='target')
    category = models.TextField()
    subcategory = models.TextField()
    data = models.TextField()
    update = models.ForeignKey(BasicTwitterInfo, related_name='update')

    def __str__(self):
        return self.target.username + ':' + self.category + ':' + self.subcategory
