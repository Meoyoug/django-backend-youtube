upstream daphne {
    server daphne:8000;
}

server {
    listen 80               default_server;
    include                 /etc/nginx/uwsgi_params;
    client_max_body_size    10M;

    location / {
      include /etc/nginx/uwsgi_params;
      uwsgi_pass ${APP_HOST}:${APP_PORT};
    }

    location /ws/chat/ {
      proxy_pass https://daphne;
      proxy_http_version 1.1;
    }

    location /static {
          alias /vol/static;
    }
}