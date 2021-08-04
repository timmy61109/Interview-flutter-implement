"""interview_flutter_implement URL Configuration.

The `urlpatterns` list routes URLs to views. For more information please see:
    https://docs.djangoproject.com/en/3.2/topics/http/urls/
Examples:
Function views
    1. Add an import:  from my_app import views
    2. Add a URL to urlpatterns:  path('', views.home, name='home')
Class-based views
    1. Add an import:  from other_app.views import Home
    2. Add a URL to urlpatterns:  path('', Home.as_view(), name='home')
Including another URLconf
    1. Import the include() function: from django.urls import include, path
    2. Add a URL to urlpatterns:  path('blog/', include('blog.urls'))
"""
from django.contrib import admin
from django.urls import path
# from django.urls import include
from django.views.decorators.csrf import csrf_exempt
from graphene_django.views import GraphQLView
from users.views import add
from users.views import here
from users.views import index
from users.views import math
from users.views import menu


urlpatterns = [
    path('admin/', admin.site.urls),
    path("graphql", csrf_exempt(GraphQLView.as_view(graphiql=True))),
    path('here/', here),
    path('menu/', menu),
    path('', index),
    path('<int:variable_a>/plus/<int:variable_b>/', add),
    path('<int:variable_a>/math/<int:variable_b>/', math)
]
