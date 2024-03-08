server {
    listen 80               default_server;
    include                 /etc/nginx/uwsgi_params;
    client_max_body_size    10M;

    location / {
      include /etc/nginx/uwsgi_params;
      uwsgi_pass ${APP_HOST}:${APP_PORT};
    }

    location /ws/chat/ {
      proxy_pass https:ec2-52-78-65-231.ap-northeast-2.compute.amazonaws.com;
      proxy_http_version 1.1;
    }

    location /static {
          alias /vol/static;
    }
}