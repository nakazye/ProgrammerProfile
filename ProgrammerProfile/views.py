from django.shortcuts import render_to_response
from django.http import HttpResponseRedirect
from django.http import Http404
from django.http import HttpResponseServerError
from django.template import RequestContext
from django.contrib.auth import logout as auth_logout
from django.core.context_processors import csrf
from django.core.exceptions import ObjectDoesNotExist
from django.utils import timezone
from django.db.models import Max
from django.db.models import Count
from requests_oauthlib import OAuth1Session
from ProgrammerProfile.models import BasicTwitterInfo
from ProgrammerProfile.models import UserInfo

import os
import json
import datetime

TW_SESSION = OAuth1Session(
    os.environ.get('TWITTER_KEY_FOR_POST'),
    os.environ.get('TWITTER_SECRET_FOR_POST'),
    os.environ.get('TWITTER_ACCESS_FOR_POST'),
    os.environ.get('TWITTER_ACCESS_SECRET_FOR_POST')
)
TW_USER_SHOW_URL = 'https://api.twitter.com/1.1/users/show.json'

SKILL_LANGUAGE_CATEGORY = ('ABAP',
                           'ActionScript',
                           'AppleScript',
                           'AWK',
                           'Bash',
                           'BASIC',
                           'C',
                           'C#',
                           'C++',
                           'Caml(include OCaml)',
                           'Clojure',
                           'COBOL',
                           'CoffeeScript',
                           'csh',
                           'CSS',
                           'D',
                           'Dart',
                           'Delphi',
                           'Erlang',
                           'F#',
                           'FORTRAN',
                           'Go',
                           'Groovy',
                           'Haskell',
                           'HTML',
                           'Java',
                           'JavaScript',
                           'ksh',
                           'LISP(include Scheme, Common Lisp, etc...)',
                           'LotusScript',
                           'Lua',
                           'mruby',
                           'Objective-C',
                           'Pascal',
                           'Perl',
                           'PHP',
                           'PL/I',
                           'PowerShell',
                           'Prolog',
                           'Python',
                           'R',
                           'RPG',
                           'Ruby',
                           'Rust',
                           'Scala',
                           'sh',
                           'Smalltalk',
                           'SQL',
                           'Swift',
                           'TeX',
                           'Tcl',
                           'tcsh',
                           'TypeScript',
                           'VBScript',
                           'Vim script',
                           'Visual Basic',
                           'zsh',
                           'なでしこ')



def index(request):
    context = {'viewName': 'index'}

    if request.user.is_authenticated():
        context.update({'username': request.user})

    return render_to_response('index.html',
                              context,
                              context_instance=RequestContext(request))

def logout(request):
    auth_logout(request)
    return HttpResponseRedirect('/')


def staruser(request, category=None):
    context = {'viewName': 'staruser'}

    context.update({'selected': category,
                    'skilllist': SKILL_LANGUAGE_CATEGORY})

    userinfos = BasicTwitterInfo.objects.filter(target__category='skill',
                                                target__subcategory=category).annotate(num_recommend=Count('target')).order_by('-num_recommend')
    context.update({'users': userinfos})

    return render_to_response('staruser.html',
                              context,
                              context_instance=RequestContext(request))


def user(request, username=None):
    if username is None:
        try:
            username = request.GET['username']
        except:
            return HttpResponseRedirect('/')
    context = {'viewName': 'user'}
    if request.user.username == username:
        context['viewName'] = 'myprofile'

    username = username.strip()

    if username.startswith('@'):
        return HttpResponseRedirect('/user/' + username.replace('@', ''))
        
    context.update(csrf(request))

    context.update({'skillLanguageCategory': SKILL_LANGUAGE_CATEGORY})

    # --- basic info ---
    try:
        # get DB Userdata
        userdata = BasicTwitterInfo.objects.get(username=username)
        if userdata.lastUpdate > (timezone.now() + datetime.timedelta(days=1)):
            # update DB Userdata from twitter
            if twResponse.status_code == 200:
                twResponse = TW_SESSION.get(TW_USER_SHOW_URL, params={'screen_name': username})
                userdata.userImage = twResponseData['profile_image_url']
                userdata.userScreenName = twResponseData['name']
                userdata.userDescription = twResponseData['description']
                userdata.save()
            elif twResponse.status_code == 404:
                context.update({'status': 'UNKNOWN_USER'})
                return render_to_response('user.html',
                                          context,
                                          context_instance=RequestContext(request))
            else:
                context.update({'status': 'UNKNOWN_ERROR'})
                return render_to_response('user.html',
                                          context,
                                          context_instance=RequestContext(request))
    except ObjectDoesNotExist:
        # create DB Userdata from twitter
        twResponse = TW_SESSION.get(TW_USER_SHOW_URL, params={'screen_name': username})
        if twResponse.status_code == 200:
            twResponseData = json.loads(twResponse.text)
            userdata = BasicTwitterInfo(username=username,
                                        userImage=twResponseData['profile_image_url'],
                                        userScreenName=twResponseData['name'],
                                        userDescription=twResponseData['description'],
                                        lastUpdate=timezone.now())
            userdata.save()
        elif twResponse.status_code == 404:
            context.update({'status': 'UNKNOWN_USER'})
            return render_to_response('user.html',
                                      context,
                                      context_instance=RequestContext(request))
        else:
            context.update({'status': 'UNKNOWN_ERROR'})
            return render_to_response('user.html',
                                      context,
                                      context_instance=RequestContext(request))
    context.update({'userdata': userdata,
                    'userName': userdata.username,
                    'userImage': userdata.userImage.replace('_normal', '_bigger'),
                    'userScreenName': userdata.userScreenName,
                    'userDescription': userdata.userDescription})

    # --- social/homepage/skill recommend/comment info ---
    userinfos = UserInfo.objects.filter(target=userdata)
    userhps = []
    userskills = {}
    usercomments = []
    isUserConfirm = False
    for userinfo in userinfos:
        if userinfo.category == 'social':
            context.update({(userinfo.category + userinfo.subcategory): userinfo})
        elif userinfo.category == 'userhp':
            userhps.append(userinfo)
        elif userinfo.category == 'skill' and userinfo.data == 'skilled':
            if userinfo.subcategory in userskills:
                userskills[userinfo.subcategory].append(userinfo)
            else:
                userskills[userinfo.subcategory] = [userinfo,]
        elif  userinfo.category == 'comment' and userinfo.data != '':
            usercomments.append(userinfo)

        if request.user.is_authenticated():
            if userinfo.update.username == username:
                isUserConfirm = True

    print(isUserConfirm)

    context.update({'userhps': userhps})
    context.update({'userskills': userskills})
    context.update({'usercomments': usercomments})
    context.update({'isUserConfirm': isUserConfirm})
    
    return render_to_response('user.html',
                              context,
                              context_instance=RequestContext(request))


def updateInfo(request):

    if request.method == 'GET':
        return HttpResponseRedirect('/')

    username = request.REQUEST['username'].strip()
    category = request.REQUEST['category']
    subcategory = request.REQUEST['subcategory']
    account = request.REQUEST['account'].strip()

    userdata = BasicTwitterInfo.objects.get(username=username) # if no user data, raise ObjectDoesNotExist

    # validation
    if category == 'social':
        if subcategory in ('github',
                           'stackexchange',
                           'slashdoten',
                           'slashdotja',
                           'qiita',
                           'slideshare',
                           'hatena',
                           'quora',
                           'linkedin',
                           'facebook',
                           'googleplus'):
            if subcategory in ('quora',
                               'linkedin',
                               'facebook',
                               'googleplus'):
                if username != request.user.username:
                    return user(request, username)
        else:
            return user(request, username)
    elif category == 'userhp' and username == request.user.username:
        if subcategory == '':
            datasize = UserInfo.objects.filter(target=userdata, category='userhp').aggregate(Max('subcategory'))['subcategory__max']
            if isinstance(datasize,type(None)):
                datasize = '000'
            elif datasize == '999':
                return user(request, username) # maybe nuisance
            subcategory = str(int(datasize) + 1).zfill(3)
    elif category == 'skill' and subcategory in SKILL_LANGUAGE_CATEGORY:
        pass
    elif category == 'comment':
        pass
    else:
        return user(request, username)

    try:
        # update data
        if category in ('skill', 'comment'):
            me = BasicTwitterInfo.objects.get(username=request.user.username)
            userinfo = UserInfo.objects.get(target=userdata,
                                            category=category,
                                            subcategory=subcategory,
                                            update=me)
        elif category in ('social', 'userhp'):
            userinfo = UserInfo.objects.get(target=userdata,
                                            category=category,
                                            subcategory=subcategory)
        
        if userinfo.update.username == username and username != request.user.username and userinfo.data != '': # validation
            return user(request, username)

        if category == 'skill' and account == 'delete':
            userinfo.delete()
        else:
            userinfo.data = account
            userinfo.update = BasicTwitterInfo.objects.get(username=request.user.username)
            userinfo.save()

    except ObjectDoesNotExist:
        # create data
        try:
            me = BasicTwitterInfo.objects.get(username=request.user.username)
        except ObjectDoesNotExist:
            user(request, request.user.username) # create my data
            me = BasicTwitterInfo.objects.get(username=request.user.username)
        userinfo = UserInfo(target=userdata,
                            category=category,
                            subcategory=subcategory,
                            data=account,
                            update=me)
        userinfo.save()

    return user(request, username)
