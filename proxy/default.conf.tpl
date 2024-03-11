server {
    listen $LISTEN_PORT;

    location / {
            proxy_pass http://$APP_HOST:$APP_PORT;
            proxy_http_version 1.1;
            proxy_set_header Upgrade $http_upgrade;
            proxy_set_header Connection "upgrade";
            add_header Access-Control-Allow-Origin "ec2-43-203-205-96.ap-northeast-2.compute.amazonaws.com";
            client_max_body_size 10M;
        }

    location /static {
          alias /vol/static;
    }
}
