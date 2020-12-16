FROM alpine

COPY srcs/favicon.ico /var/www/
COPY srcs/onload.sh /var/
COPY srcs/download-wp.sh srcs/phpfpminit.sh /tmp/
COPY srcs/nginx.conf /etc/nginx/

RUN apk add nginx mariadb-client php php7-fpm php7-json php7-phar php7-mbstring php7-mysqli curl
RUN /tmp/phpfpminit.sh; /tmp/download-wp.sh
RUN addgroup -S www; adduser -HDG www www;
RUN chown -R www:www /var/www /var/lib/nginx; chmod -R 755 /var/www /var/lib/nginx;

WORKDIR /var/www
CMD /var/onload.sh
