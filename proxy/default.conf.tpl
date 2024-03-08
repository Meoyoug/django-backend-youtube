upstream chatting_group {
    server app:8000;
}

server {
    listen 80;
    client_max_body_size 50M;

    location / {
        proxy_pass http://chatting_group;
    }

    location /ws/chat {
        proxy_pass http://chatting_group;
        proxy_http_version 1.1;
    }
    
    location /static {
        alias /vol/static;
    }
}