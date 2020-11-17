#fastcgi.sh start;
cd /usr
/usr/bin/mysqld_safe --datadir='/var/lib/mysql' &
php-fpm7
nginx -g 'daemon off;'
