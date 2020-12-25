FROM alpine

COPY srcs/index.html srcs/default.conf /var/www/
COPY srcs/onload.sh /

RUN apk add openssl nginx openssh && mkdir /run/nginx &&\
    mv /var/www/default.conf /etc/nginx/conf.d/ &&\
    openssl req -x509 -newkey rsa:4096 -keyout /etc/ssl/nginx.key \
    -out /etc/ssl/nginx.crt -days 365 -nodes -subj '/CN=itressa' && \
    (echo service; echo service) | adduser itressa && \
    ssh-keygen -A;

CMD /onload.sh
