#!/usr/bin/env python
# -*- coding: utf-8 -*- #
from __future__ import unicode_literals

AUTHOR = u'Don Han'
SITENAME = u'Don Han'
SITEURL = 'http://don-han.com'

TIMEZONE = 'US/Pacific'

DEFAULT_LANG = u'en'

# Feed generation is usually not desired when developing
FEED_ALL_ATOM = None
CATEGORY_FEED_ATOM = None
TRANSLATION_FEED_ATOM = None

# Theme
THEME = "blue-penguin"

# Blogroll
#LINKS =  ( ) 
# Social widget
SOCIAL = (('LinkedIn', 'https://www.linkedin.com/in/donhan'),
          ('GitHub', 'https://github.com/don-han'),)

DEFAULT_PAGINATION = 10

STATIC_PATHS = ['images', 'extra']
EXTRA_PATH_METADATA = {'extra/CNAME': {'path': 'CNAME'},
                       'extra/Resume_Don_Han.pdf':{'path': 'Resume_Don_Han.pdf'},
                       'extra/favicon.ico':{'path': 'favicon.ico'},
                       'extra/googlef7d891041bb9c9a5.html':{'path':'googlef7d891041bb9c9a5.html'},
                       'extra/sitemap.xml':{'path':'sitemap.xml'}, }

READERS = {'html':None}

# Uncomment following line if you want document-relative URLs when developing
#RELATIVE_URLS = True
