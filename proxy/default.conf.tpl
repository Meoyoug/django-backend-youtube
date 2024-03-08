server {

    location / {
        include /etc/nginx/uwsgi_params;
        uwsgi_pass uwsgi;
        client_max_body_size 10M;

        add_header Access-Control-Allow-Origin "ec2-52-78-65-231.ap-northeast-2.compute.amazonaws.com";
    }

    location /ws/chat/ {
        proxy_pass http://daphne;
        proxy_http_version 1.1;
        client_max_body_size 10M;
        add_header Access-Control-Allow-Origin "ec2-52-78-65-231.ap-northeast-2.compute.amazonaws.com";
    }

    location /static {
        alias /vol/static;
    }
}
