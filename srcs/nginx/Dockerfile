FROM alpine:latest

COPY ./srcs/default.conf ./srcs/index.html ./srcs/supervisord.conf ./
RUN apk add openrc openssl openssh nginx vim bash sudo supervisor

RUN openssl req -x509 -newkey rsa:4096 -keyout /etc/ssl/nginx.key -out /etc/ssl/nginx.crt -days 365 -nodes -subj '/CN=itressa'

RUN mv /default.conf /etc/nginx/conf.d/ && mv /index.html /var/www/ \
&& mkdir /run/nginx /var/run/sshd && mv /supervisord.conf /etc/supervisord.conf

#launch server
CMD		["usr/bin/supervisord", "-c", "/etc/supervisord.conf"]
