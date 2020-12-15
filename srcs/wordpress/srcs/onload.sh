php-fpm7
set_error() { return 1;}
set_error;
until [ $? -eq 0 ]
do
    sleep 3;
    mysql wordpress -hmysql -uwp_user -ppassword_wp -e';';
done;
wp core install --url=https://192.168.99.193:5050 --title="itressa's k8s services" --admin_user="itressa" --admin_password="itressa" --admin_email="itressa@email.com" --skip-email

for NAME in editor author contributor
do
    wp user create $NAME $NAME@itressa.test --role=$NAME --user_pass=$NAME
done
# create some subscribers
for NAME in Paul Alex Phillip
do
    wp user create $NAME $NAME@itressa.test --role=subscriber --user_pass=$NAME
done
nginx -g 'daemon off;'
