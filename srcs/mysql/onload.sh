mysql_install_db --user=mysql --basedir=/usr --datadir=/var/lib/mysql
cd '/usr'
/usr/bin/mysqld_safe --datadir='/var/lib/mysql' --init_file=/start.sql
echo "DB CREATED"
/bin/sh
echo 'STARTSH LEFT'
while true; do sleep 5; done
