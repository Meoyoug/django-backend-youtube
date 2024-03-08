upstream uwsgi {
  server  uwsgi:${APP_PORT};
}

upstream daphne {
    server daphne:${LISTEN_PORT};
}

map $http_upgrade $connection_upgrade {
  default upgrade;
    '' close;
}

server {
    listen 80               default_server;
    include                 /etc/nginx/uwsgi_params;
    client_max_body_size    10M;

    location / {
      include /etc/nginx/uwsgi_params;
      uwsgi_pass uwsgi;

      uwsgi_param Host $host;
      uwsgi_param X-Real-IP $remote_addr;
      uwsgi_param X-Forwarded-For $proxy_add_x_forwarded_for;
      uwsgi_param X-Forwarded-Proto $http_x_forwarded_proto;
    }

    location /ws/chat/<int:room_id>/ {
      proxy_pass http://daphne;
      proxy_http_version 1.1;
      proxy_set_header Upgrade $http_upgrade;
      proxy_set_header Connection $connection_upgrade;
      
      proxy_redirect     off;
      proxy_set_header   Host $host;
      proxy_set_header   X-Real-IP $remote_addr;
      proxy_set_header   X-Forwarded-For $proxy_add_x_forwarded_for;
      proxy_set_header   X-Forwarded-Host $server_name;
    }

    location /static {
          alias /vol/static;
    }
}