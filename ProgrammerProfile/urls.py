from django.conf import settings
from django.conf.urls import patterns, include, url
from django.conf.urls.static import static
from django.contrib import admin
from rest_framework import routers

router = routers.DefaultRouter()

urlpatterns = patterns('',
    url('^admin/',
        include(admin.site.urls)),
    url('^$',
        'ProgrammerProfile.views.index'),
    url('^api/mainMenu',
        'ProgrammerProfile.views.mainMenu')
) + static(settings.STATIC_URL,
           document_root=settings.STATIC_ROOT)
