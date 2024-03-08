upstream daphne {
    server app:8000;
}

server {
    listen 80;
    client_max_body_size 50M;

    location / {
        uwsgi_pass               app:8000;
        include                  /etc/nginx/uwsgi_params;
        client_max_body_size     10M;
        add_header Access-Control-Allow-Origin "http://ec2-52-78-65-231.ap-northeast-2.compute.amazonaws.com";
    }

    location /ws/chat {
        proxy_pass http://daphne;
        proxy_http_version 1.1;
        proxy_set_header Upgrade $http_upgrade;
        proxy_set_header Connection "upgrade";

        proxy_redirect off;
        proxy_set_header Host $host;
        add_header Access-Control-Allow-Origin "http://ec2-52-78-65-231.ap-northeast-2.compute.amazonaws.com";
    }
    
    location /static {
        alias /vol/static;
    }
}