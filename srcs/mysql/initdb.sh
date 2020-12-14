mysql_install_db --user=mysql --basedir=/usr --datadir=/var/lib/mysql
cd '/usr'
/usr/bin/mysqld_safe --datadir='/var/lib/mysql' &
echo "SERVER STARTING"
sleep 3 # wait for mysql to start
# create db user for wp
MCMD1="echo \"GRANT ALL PRIVILEGES ON *.* TO 'wp_user'@'%' IDENTIFIED BY 'password_wp';\" | mysql -u root"
eval ${MCMD1}
while [ $? -ne 0 ]; do # retry in case of error: probably still not started
    sleep 2
    eval ${MCMD1}
done
echo "USER CREATED"
# create db for wp using wp user
MCMD2="echo \"CREATE DATABASE wordpress;\" | mysql -u wp_user -ppassword_wp"
eval ${MCMD2}
while [ $? -ne 0 ]; do
    sleep 2
    eval ${MCMD2}
done
echo "DB CREATED"
