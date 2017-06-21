#!/usr/bin/python
# -*- coding:utf-8 -*-

from bottle import route, run


@route('/index', methods=['GET'])
def index():
    return 'hi'

run(host='localhost', port=9001)


