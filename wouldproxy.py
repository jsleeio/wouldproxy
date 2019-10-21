#!/usr/bin/env python

import requests
from sys import argv

for u in argv[1:]:
    eproxy = requests.utils.get_environ_proxies(u) 
    if 'http' in eproxy:
        print('would use proxy {proxy} for {url}'.format(url=u, proxy=eproxy['http']))
    else:
        print('would not use proxy for {url}'.format(url=u))
