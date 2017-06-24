#!/usr/bin/python
# -*- coding: utf-8 -*-

from bottle import route, run, static_file, error, request
import redis
import ConfigParser

config = ConfigParser.ConfigParser()
config.readfp(open('../config/config.ini'), 'rb')

# config
redis_host = config.get('global', 'redis_host')
redis_port = config.get('global', 'redis_port')
web_host = config.get('global', 'web_host')
web_port = config.get('global', 'web_port')
web_directory = config.get('global', 'web_directory')


pool = redis.ConnectionPool(host=redis_host, port=redis_port)
r = redis.Redis(connection_pool=pool)


@route('/', method='GET')
def index():
    return static_file('index.html', root=web_directory)


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

run(host=web_host, port=web_port)


