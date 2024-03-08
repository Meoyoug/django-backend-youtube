server {
    listen 80               default_server;
    include                 /etc/nginx/uwsgi_params;
    client_max_body_size    10M;

    location / {
      include /etc/nginx/uwsgi_params;
      uwsgi_pass ${APP_HOST}:${APP_PORT};

      uwsgi_param Host $host;
      uwsgi_param X-Real-IP $remote_addr;
      uwsgi_param X-Forwarded-For $proxy_add_x_forwarded_for;
      uwsgi_param X-Forwarded-Proto $http_x_forwarded_proto;
    }

    location /ws/chat/ {
      proxy_pass ${APP_HOST}:8000;
      proxy_http_version 1.1;
    }

    location /static {
          alias /vol/static;
    }
}