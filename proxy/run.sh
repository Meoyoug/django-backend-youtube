#!/bin/sh
set -e

echo "'django' service is up - executing command"
envsubst < /etc/nginx/nginx.conf > /etc/nginx/conf.d/nginx.conf
nginx -g 'daemon off;'
