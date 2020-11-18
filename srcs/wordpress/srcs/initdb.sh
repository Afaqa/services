mysql_install_db --user=mysql --basedir=/usr --datadir=/var/lib/mysql
cd '/usr'
/usr/bin/mysqld_safe --datadir='/var/lib/mysql' &
sleep 3 # wait for mysql to start
# create db user for wp
MCMD1="echo \"GRANT ALL PRIVILEGES ON *.* TO 'wp_user'@'localhost' IDENTIFIED BY 'password_wp';\" | mysql -u root"
eval ${MCMD1}
while [ $? -ne 0 ]; do # retry in case of error: probably still not started
    sleep 2
    eval ${MCMD1}
done
# create db for wp using wp user
MCMD2="echo \"CREATE DATABASE wordpress;\" | mysql -u wp_user -ppassword_wp"
eval ${MCMD2}
while [ $? -ne 0 ]; do
    sleep 2
    eval ${MCMD2}
done

cd /var/www
## install wordpress using wp-cli
# get wp-cli file and place it into PATH folder
curl -O https://raw.githubusercontent.com/wp-cli/builds/gh-pages/phar/wp-cli.phar &&\
mv wp-cli.phar /usr/local/bin/wp && chmod +x /usr/local/bin/wp
# download and install
wp core download && wp config create --dbname=wordpress --dbuser=wp_user --dbpass=password_wp &&\
wp core install --url=https://192.168.99.193:5050 --title="itressa's k8s services" --admin_user="itressa" --admin_password="itressa" --admin_email="itressa@email.com" --skip-email
# create users with roles
for NAME in editor author contributor
do
    wp user create $NAME $NAME@itressa.test --role=$NAME --user_pass=$NAME
done
# create some subscribers
for NAME in Paul Alex Phillip
do
    wp user create $NAME $NAME@itressa.test --role=subscriber --user_pass=$NAME
done
