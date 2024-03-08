upstream uwsgi {
    server django:8000;
}

upstream daphne {
    server daphne:9000;
}

server {
    listen 80;

    location / {
        uwsgi_pass uwsgi;
        include /etc/nginx/uwsgi_params;
        client_max_body_size 10M;

        add_header Access-Control-Allow-Origin "https://ec2-52-78-65-231.ap-northeast-2.compute.amazonaws.com";
    }

    location /ws/ {
        proxy_pass https://daphne;
        proxy_http_version 1.1;

        add_header Access-Control-Allow-Origin "https://ec2-52-78-65-231.ap-northeast-2.compute.amazonaws.com";
    }
}
