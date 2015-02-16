from django.conf import settings
from django.conf.urls import patterns, include, url
from django.conf.urls.static import static
from django.contrib import admin
from django.contrib.sitemaps.views import sitemap
from ProgrammerProfile import sitemaps as my_sitemaps

sitemaps = {'index': my_sitemaps.IndexSitemap,
            'stats': my_sitemaps.StatsSitemap,
            'staruser': my_sitemaps.StaruserSitemap,
            'user': my_sitemaps.UserSitemap}

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
    url('^stats/$',
        'ProgrammerProfile.views.stats'),
    url('^logout/',
        'ProgrammerProfile.views.logout'),
    url('',
        include('social.apps.django_app.urls', namespace='social')),
    url('^sitemap\.xml$', sitemap, {'sitemaps': sitemaps},
        name='django.contrib.sitemaps.views.sitemap')
) + static(settings.STATIC_URL,
           document_root=settings.STATIC_ROOT)
