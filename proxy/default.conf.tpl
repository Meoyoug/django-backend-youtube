server {
    listen ${LISTEN_PORT};
    
    location /static {
          alias /vol/static;
    }

    location / {
        uwsgi_pass ${APP_HOST}:8000;
        include /etc/nginx/uwsgi_params;
        client_max_body_size 10M;

        add_header Access-Control-Allow-Origin "https://ec2-52-78-65-231.ap-northeast-2.compute.amazonaws.com";
    }

    location /ws/ {
        proxy_pass https://daphne:9000;
        proxy_http_version 1.1;

        add_header Access-Control-Allow-Origin "https://ec2-52-78-65-231.ap-northeast-2.compute.amazonaws.com";
    }
}
