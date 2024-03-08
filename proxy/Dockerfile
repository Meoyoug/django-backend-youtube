FROM nginx:latest
LABEL maintainer='meoyong'

COPY ./default.conf.tpl /etc/nginx/default.conf.tpl
COPY ./uwsgi_params /etc/nginx/uwsgi_params
COPY ./run.sh /run.sh

ENV LISTEN_PORT=8000
ENV APP_HOST=app
ENV APP_PORT=9000

USER root

RUN mkdir -p /vol/static && \
    chmod 755 /vol/static
    
RUN mkdir -p /var/cache/nginx/client_temp && \
    chown -R nginx:nginx /var/cache/nginx && \
    chmod 777 /etc/nginx/nginx.conf && \
    sed -i '/^http {/a \
    server { \
        listen       80; \
        server_name  localhost; \
        location / { \
            add_header Access-Control-Allow-Origin "ec2-52-78-65-231.ap-northeast-2.compute.amazonaws.com"; \
        } \
    }' /etc/nginx/nginx.conf && \
    chmod 777 /var/run

RUN touch /etc/nginx/conf.d/default.conf && \
    chown nginx:nginx /etc/nginx/conf.d/default.conf && \
    chmod +x /run.sh && \
    chmod +x docker-entrypoint.sh

VOLUME /vol/static

USER nginx

CMD ["/run.sh"]
