"""Create your models here."""
from django.contrib.auth.models import AbstractUser
from django.db import models


class CustomUser(AbstractUser):
    """Create the custom user model."""

    EMAIL_FIELD = 'email'
    USERNAME_FIELD = 'email'
    REQUIRED_FIELDS = ['username']
    username = models.CharField(
        blank=True, max_length=254, unique=False,)
    email = models.EmailField(
        blank=False, max_length=254, unique=True, verbose_name="email address")
