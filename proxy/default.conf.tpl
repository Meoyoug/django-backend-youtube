server {
     listen ${LISTEN_PORT};

     location /static {
          alias /vol/static;
     }


     location / {
          add_header Access-Control-Allow-Origin "ec2-52-78-65-231.ap-northeast-2.compute.amazonaws.com";
          uwsgi_pass               ${APP_HOST}:${APP_PORT};
          include                  /etc/nginx/uwsgi_params;
          client_max_body_size     10M;

     }
}