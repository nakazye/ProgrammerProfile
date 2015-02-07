from django.conf import settings
from django.conf.urls import patterns, include, url
from django.conf.urls.static import static
from django.contrib import admin

urlpatterns = patterns('',
    url('^admin/',
        include(admin.site.urls)),
    url('^$',
        'ProgrammerProfile.views.index'),
    url('^user/(?P<username>\w+)/$',
        'ProgrammerProfile.views.user'),
    url('^user/$',
        'ProgrammerProfile.views.user'),
    url('^updateInfo$',
        'ProgrammerProfile.views.updateInfo'),
    url('^staruser/$',
        'ProgrammerProfile.views.staruser'),
    url('^staruser/(?P<category>[^/]+)/$',
        'ProgrammerProfile.views.staruser'),
    url('^logout/',
        'ProgrammerProfile.views.logout'),
    url('',
        include('social.apps.django_app.urls', namespace='social')),
) + static(settings.STATIC_URL,
           document_root=settings.STATIC_ROOT)
