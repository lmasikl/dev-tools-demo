from django.db import models


class ToDo(models.Model):
    status = models.IntegerField()
    task = models.TextField()
