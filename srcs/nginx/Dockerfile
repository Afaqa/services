FROM alpine:latest

COPY srcs/index.html srcs/default.conf /var/www/

RUN apk add openssl nginx && mkdir /run/nginx &&\
    mv /var/www/default.conf /etc/nginx/conf.d/ &&\
    openssl req -x509 -newkey rsa:4096 -keyout /etc/ssl/nginx.key \
    -out /etc/ssl/nginx.crt -days 365 -nodes -subj '/CN=itressa'

# launch in foreground
CMD nginx -g 'daemon off;'
