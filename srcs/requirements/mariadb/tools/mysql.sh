#!/bin/sh

if [ ! -d "/var/lib/mysql/wordpress" ]
then 

service mariadb start
mysql -e "CREATE DATABASE IF NOT EXISTS \`${DB_NAME}\`;"
mysql -e "CREATE USER IF NOT EXISTS \`${DB_USER}\`@'%' IDENTIFIED BY '${DB_PASSWORD}';"
mysql -e "GRANT ALL PRIVILEGES ON \`${DB_NAME}\`.* TO \`${DB_USER}\`@'%'"
mysql -e "FLUSH PRIVILEGES"
mysql -u root --skip-password -e "ALTER USER 'root'@'localhost' IDENTIFIED BY '${DB_ROOT_PASS}';"
#mysqladmin -u root -p$DB_ROOT_PASS shutdown
fi

exec mysqld -u root