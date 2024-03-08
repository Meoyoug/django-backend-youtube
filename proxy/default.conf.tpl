upstream daphne_backend {
    server app:${DAPHNE_PORT};
}

upstream uwsgi_backend {
    server app:${UWSGI_PORT};
}

server {
    listen ${LISTEN_PORT};

    location /static {
        alias /vol/static;
    }

    location / {
        add_header Access-Control-Allow-Origin "ec2-52-78-65-231.ap-northeast-2.compute.amazonaws.com";
        uwsgi_pass uwsgi_backend;
        include /etc/nginx/uwsgi_params;
        client_max_body_size 10M;
    }
}

server {
    listen ${DAPHNE_PORT};

    location / {
        proxy_pass http://daphne_backend;
        proxy_http_version 1.1;
        proxy_set_header Upgrade $http_upgrade;
        proxy_set_header Connection "upgrade";
    }
}