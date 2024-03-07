# !/bin/sh

set -e

# 도커파일의 ENV 들을 가져와서 복사한다.
envsubst < /etc/nginx/default.conf.tpl > /etc/nginx/conf.d/default.conf
# nginx 를 실행시키고 -> nginx -g 백그라운드에올리니까 같이 실행시키는 옵션 -> demon off
nginx -g 'demon off;'