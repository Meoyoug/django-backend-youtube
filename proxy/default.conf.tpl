server {
    listen 80;

    location / {
        uwsgi_pass django:9000;
        include /etc/nginx/uwsgi_params;
        client_max_body_size 10M;

        add_header Access-Control-Allow-Origin "http://ec2-52-78-65-231.ap-northeast-2.compute.amazonaws.com";
    }

    location /ws/ {
        daphne_pass daphne:8000;
        proxy_http_version 1.1;
        proxy_set_header Upgrade $http_upgrade;
        proxy_set_header Connection "upgrade";

        add_header Access-Control-Allow-Origin "http://ec2-52-78-65-231.ap-northeast-2.compute.amazonaws.com";
    }
}
