mysql_install_db --user=mysql --basedir=/usr --datadir=/var/lib/mysql
cd '/usr'
/usr/bin/mysqld_safe --datadir='/var/lib/mysql' &
MCMD1=echo "GRANT ALL PRIVILEGES ON *.* TO 'wp_user'@'localhost' IDENTIFIED BY 'password_wp';" | mysql -u root
$(MCMD1)
while [ $? -ne 0 ]; do
    sleep 2
    $(MCMD1)
done
MCMD2=echo "CREATE DATABASE wordpress;" | mysql -u wp_user -ppassword_wp
$(MCMD2)
while [ $? -ne 0 ]; do
    sleep 2
    $(MCMD2)
done

cd /var/www
curl -O https://raw.githubusercontent.com/wp-cli/builds/gh-pages/phar/wp-cli.phar &&\
mv wp-cli.phar /usr/local/bin/wp && chmod +x /usr/local/bin/wp &&\
wp core download && wp config create --dbname=wordpress --dbuser=wp_user --dbpass=password_wp &&\
wp core install --url=192.168.99.199:5050 --title="itressa's blog" --admin_user="itressa" --admin_email="itressa@email.com" --skip-email &&\
wp user delete itressa --yes && wp user create admin admin@admin.test --role=administrator --user_pass=admin &&\
wp user create editor editor@editor.test --role=editor --user_pass=editor && wp user create subscriber subscriber@subscriber.test --role=subscriber --user_pass=subscriber
