#!/usr/bin/python
# -*- coding: utf-8 -*-

from bottle import route, run, static_file, error, request
import redis

pool = redis.ConnectionPool(host='localhost', port=6379)
r = redis.Redis(connection_pool=pool)


@route('/', method='GET')
def index():
    return static_file('index.html', root='/home/blue/PycharmProjects/DistributedSpider/web')


@route('/urls', method='POST')
def handle_urls():
    urls = request.forms.get('urls').split()
    print(urls)
    for i, url in enumerate(urls):
        r.lpush("mycrawler:start_urls", url)
    return "success"


@error(404)
def error404(error):
    return 'route error, please try the right route.\n'

run(host='localhost', port=9001)


