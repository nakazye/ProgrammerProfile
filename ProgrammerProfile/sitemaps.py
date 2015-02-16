from django.contrib.sitemaps import Sitemap
from django.core.urlresolvers import reverse
from ProgrammerProfile.models import UserInfo
import ProgrammerProfile.views
 
 
class IndexSitemap(Sitemap):
    changefreq = 'monthly'
    priority = 1.0
    protocol = 'http'
 
    def items(self):
        return ['index']
 
    def location(self, obj):
        return reverse('ProgrammerProfile.views.index')


class StatsSitemap(Sitemap):
    changefreq = 'monthly'
    priority = 0.9
    protocol = 'http'
 
    def items(self):
        return ['stats']
 
    def location(self, obj):
        return reverse('ProgrammerProfile.views.stats')


class StaruserSitemap(Sitemap):
    changefreq = 'monthly'
    priority = 0.8
    protocol = 'http'

    def items(self):
        rtn = []
        rtn.extend(ProgrammerProfile.views.SKILL_LANGUAGE_CATEGORY)
        rtn.extend(ProgrammerProfile.views.SKILL_EDITOR_CATEGORY)
        rtn.extend(ProgrammerProfile.views.SKILL_PLATFORM_CATEGORY)
        rtn.extend(ProgrammerProfile.views.SKILL_CONFIGURATION_CATEGORY)
        rtn.extend(ProgrammerProfile.views.SKILL_OTHERS_CATEGORY)
        return rtn

    def location(self, obj):
        return reverse('ProgrammerProfile.views.staruser', args=[obj])

class UserSitemap(Sitemap):
    changefreq = 'monthly'
    priority = 0.5
    protocol = 'http'

    def items(self):
        rtn = list(set([x['target__username'] for x in UserInfo.objects.values('target__username')]))
        return rtn

    def location(self, obj):
        return reverse('ProgrammerProfile.views.user', args=[obj])
        
