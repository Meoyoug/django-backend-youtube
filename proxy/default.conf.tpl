server {
    listen ${LISTEN_PORT};

    location / {
        uwsgi_pass ${APP_HOST}:${APP_PORT};
        include uwsgi_params;
        client_max_body_size 50M;

        add_header Access-Control-Allow-Origin "";

    }

    location /ws/ {
        proxy_pass http://${APP_HOST}:${APP_PORT};
        proxy_http_version 1.1;
        proxy_set_header Upgrade $http_upgrade;
        proxy_set_header Connection "upgrade";

        add_header Access-Control-Allow-Origin "";

    }
    
    location /static {
          alias /vol/static;
    }
}
