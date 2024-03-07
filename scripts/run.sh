# !/bin/sh

set -e

python manage.py wait_for_db
python manage.py migrate

# uWSGI: Nginx 로부터 데이터를 받아오면 장고랑 소통하는 역할
# 파이썬 워커는 4 개 쓸거고 쓰레드를 사용가능하게 하겠다.라는 의미.
uwsgi --socket :9000 --workers 4 --master --enable-threads --module app.wsgi