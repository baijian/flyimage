#!/bin/bash
rm -fr client_body_temp
rm -fr fastcgi_temp
rm -fr proxy_temp
rm -fr scgi_temp
rm -fr uwsgi_temp
rm -fr cache
mkdir cache
echo '' > logs/access.log
echo '' > logs/error.log
