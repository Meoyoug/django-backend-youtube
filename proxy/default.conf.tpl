upstream chatting_group {
    server app:8000;
}

server {
    listen 80;
    client_max_body_size 50M;

    location / {
        proxy_pass http://chatting_group;
        add_header Access-Control-Allow-Origin "ec2-52-78-65-231.ap-northeast-2.compute.amazonaws.com";
    }

    location /ws/chat {
        proxy_pass http://chatting_group;
        proxy_http_version 1.1;
        add_header Access-Control-Allow-Origin "ec2-52-78-65-231.ap-northeast-2.compute.amazonaws.com";
    }
    
    location /static {
        alias /vol/static;
    }
}