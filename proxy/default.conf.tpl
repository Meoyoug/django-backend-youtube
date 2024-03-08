upstream chatting_group {
    server app:8000;
}

server {
    listen 80;
    client_max_body_size 50M;

    location / {
        proxy_pass http://chatting_group;
        proxy_set_header X-Forwarded-For $proxy_add_x_forwarded_for;
        proxy_set_header Host $host;
        proxy_redirect off; 
        add_header Access-Control-Allow-Origin "ec2-52-78-65-231.ap-northeast-2.compute.amazonaws.com";
    }

    location /ws/chat {
        proxy_pass http://chatting_group;
        proxy_http_version 1.1;
        proxy_set_header Upgrade $http_upgrade;
        proxy_set_header Connection "upgrade";

        proxy_redirect off;
        proxy_set_header Host $host;
        add_header Access-Control-Allow-Origin "ec2-52-78-65-231.ap-northeast-2.compute.amazonaws.com";
    }
    
    location /static {
        alias /vol/static;
    }
}