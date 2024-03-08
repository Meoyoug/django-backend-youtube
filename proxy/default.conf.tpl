upstream uwsgi {
    server app:8000;
}

upstream daphne {
    server daphne:9000;
}

server {
    listen 80;

    location / {
        proxy_pass http://uwsgi;
        include /etc/nginx/uwsgi_params;
        client_max_body_size 10M;

        proxy_set_header X-Forwarded-For $proxy_add_x_forwarded_for;
        proxy_set_header Host $host;
        proxy_redirect off;
        proxy_set_header X-Real-IP $remote_addr;

        add_header Access-Control-Allow-Origin "http://ec2-52-78-65-231.ap-northeast-2.compute.amazonaws.com";
    }

    location /ws/ {
        proxy_pass http://daphne;
        proxy_http_version 1.1;
        proxy_set_header Upgrade $http_upgrade;
        proxy_set_header Connection "upgrade";

        add_header Access-Control-Allow-Origin "http://ec2-52-78-65-231.ap-northeast-2.compute.amazonaws.com";
    }
}
