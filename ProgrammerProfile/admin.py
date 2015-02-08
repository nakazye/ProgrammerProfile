from django.contrib import admin
from ProgrammerProfile.models import BasicTwitterInfo
from ProgrammerProfile.models import UserInfo

class UserInfoAdmin(admin.ModelAdmin):
    list_display = ('target', 'category', 'subcategory', 'data')
    list_filter = ('category', 'subcategory')

admin.site.register(BasicTwitterInfo)
admin.site.register(UserInfo, UserInfoAdmin)
