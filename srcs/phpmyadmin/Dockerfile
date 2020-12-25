FROM alpine

ARG HOME=/var/www
WORKDIR $HOME

COPY srcs/default /etc/nginx/conf.d/default.conf
COPY srcs/phpfpminit.sh /tmp/
ADD https://files.phpmyadmin.net/phpMyAdmin/5.0.4/phpMyAdmin-5.0.4-english.tar.gz $HOME/

RUN apk add openssl php7 php7-mysqli php7-fpm php7-mbstring php7-json php7-session nginx supervisor
RUN mkdir /run/nginx
RUN tar -xzf phpMyAdmin-5.0.4-english.tar.gz; mv phpMyAdmin-5.0.4-english/* ./; rm -r phpMyAdmin-5.0.4-english; rm phpMyAdmin-5.0.4-english.tar.gz;
RUN cp /var/www/config.sample.inc.php /var/www/config.inc.php
RUN sed -i "s/\$cfg\['Servers'\]\[\$i\]\['host'\] = 'localhost';/\$cfg['Servers'][\$i]['host'] = 'mysql';/g" config.inc.php
RUN sed -i "s/\$cfg\['blowfish_secret'\] = ''; \/\* YOU MUST FILL IN THIS FOR COOKIE AUTH! \*\//\$cfg['blowfish_secret'] = 'TBQUWOJASBFGIUQWFBJ'; if (\$_SERVER['HTTP_X_FORWARDED_HOST']) \$cfg['PmaAbsoluteUri'] = \"http:\/\/\${_SERVER['HTTP_HOST']}\/phpmyadmin\/\";/g" config.inc.php
RUN /tmp/phpfpminit.sh
RUN addgroup -S www; adduser -HDG www www;
RUN chown -R www:www /var/www /var/lib/nginx; chmod -R 755 /var/www /var/lib/nginx;

COPY srcs/supervisord.conf /etc/

CMD supervisord
WORKDIR $HOME
