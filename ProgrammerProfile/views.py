from django.shortcuts import render_to_response
from django.template import RequestContext
from requests_oauthlib import OAuth1Session
import os

TW_SESSION = OAuth1Session(
    os.environ.get('TWITTER_KEY_FOR_POST'),
    os.environ.get('TWITTER_SECRET_FOR_POST'),
    os.environ.get('TWITTER_ACCESS_FOR_POST'),
    os.environ.get('TWITTER_ACCESS_SECRET_FOR_POST')
)
TW_USER_SHOW_URL = 'https://api.twitter.com/1.1/users/show.json'
TW_POST_URL = 'https://api.twitter.com/1.1/statuses/update.json'

def index(request):

    context = {}
    return render_to_response('index.html',
                              context,
                              context_instance=RequestContext(request))
