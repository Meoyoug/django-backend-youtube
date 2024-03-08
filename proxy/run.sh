#!/bin/sh
set -e

echo "'app' service is up - executing command"
envsubst < /etc/nginx/default.conf.tpl > /etc/nginx/conf.d/default.conf
nginx -g 'daemon off;'
