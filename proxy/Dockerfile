FROM nginx:latest
LABEL maintainer='meoyong'

# default.conf.tpl, uwsgi_params, run.sh 파일을 복사합니다.
COPY ./default.conf.tpl /etc/nginx/default.conf.tpl
COPY ./uwsgi_params /etc/nginx/uwsgi_params
COPY ./run.sh /run.sh

# 환경 변수 설정
ENV LISTEN_PORT=8000
ENV APP_HOST=app
ENV APP_PORT=9000

# root 사용자로 변경하여 권한을 부여합니다.
USER root

# /vol/static 디렉토리 생성 및 권한 설정
RUN mkdir -p /vol/static && \
    chmod 755 /vol/static
    
# nginx 관련 디렉토리 생성 및 권한 설정
RUN mkdir -p /var/cache/nginx/client_temp && \
    chown -R nginx:nginx /var/cache/nginx && \
    chmod 777 /var/run

# Nginx 설정 파일과 실행 스크립트에 대한 권한 설정
RUN touch /etc/nginx/conf.d/default.conf && \
    chown nginx:nginx /etc/nginx/conf.d/default.conf && \
    chmod +x /run.sh && \
    chmod +x /docker-entrypoint.sh

# Nginx 로그 파일을 생성하고 권한을 설정합니다.
RUN touch /var/log/nginx/access.log /var/log/nginx/error.log && \
    chown nginx:nginx /var/log/nginx/access.log /var/log/nginx/error.log

# /vol/static을 볼륨으로 설정합니다.
VOLUME /vol/static

# nginx 사용자로 변경합니다.
USER nginx

CMD ["/run.sh"]
