FROM alpine

ARG NXDIR=/etc/nginx
ARG HOME=/var/www/

COPY srcs/index.html srcs/default.conf /var/www/
COPY srcs/fastcgi.sh srcs/onload.sh srcs/autoindex.sh /usr/bin/
COPY srcs/initdb.sh srcs/phpfpminit.sh /tmp/
COPY srcs/nginx.conf /etc/nginx/
RUN chmod 755 /usr/bin/fastcgi.sh /usr/bin/onload.sh /usr/bin/autoindex.sh

# make site dir
RUN mkdir -p $HOME;

RUN apk add openssl nginx mariadb mysql-client php php7-fpm php7-json php7-phar php7-mbstring php7-mysqli curl && mkdir /run/nginx &&\
    mv /var/www/default.conf /etc/nginx/conf.d/ &&\
    openssl req -x509 -newkey rsa:4096 -keyout /etc/ssl/nginx.key \
    -out /etc/ssl/nginx.crt -days 365 -nodes -subj '/CN=itressa'

# init php-fpm
RUN /tmp/phpfpminit.sh

# create database
RUN /tmp/initdb.sh;

# grant permissions
RUN addgroup -S www; adduser -HDG www www; chown -R www:www $HOME; chmod -R 755 $HOME;

CMD onload.sh
WORKDIR $HOME
