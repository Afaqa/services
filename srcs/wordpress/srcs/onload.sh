php-fpm7
set_error() { return 1;}
set_error;
until [ $? -eq 0 ]
do
    sleep 3
    wp config create --dbhost=mysql --dbname=wordpress --dbuser=wp_user --dbpass=password_wp
done;
if ! wp core is-installed ; then
    wp core install --url=http://192.168.99.21:5050 --title="itressa's k8s services" --admin_user="itressa" --admin_password="itressa" --admin_email="itressa@email.com" --skip-email
    for NAME in editor author contributor ; do
        wp user create $NAME $NAME@itressa.test --role=$NAME --user_pass=$NAME
    done
    for NAME in Paul Alex Phillip ; do
        wp user create $NAME $NAME@itressa.test --role=subscriber --user_pass=$NAME
    done
fi
nginx -g 'daemon off;'
