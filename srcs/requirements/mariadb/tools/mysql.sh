#!/bin/bash

service mysql start 

echo "CREATE DATABASE IF NOT EXISTS $msql_db_name ;" > msql_db.sql
echo "CREATE USER IF NOT EXISTS '$msql_db1_user'@'%' IDENTIFIED BY '$msql_db_pwd' ;" >> msql_db.sql
echo "GRANT ALL PRIVILEGES ON $msql_db_name.* TO '$msql_db_user'@'%' ;" >> msql_db.sql
echo "ALTER USER 'root'@'localhost' IDENTIFIED BY '12345' ;" >> msql_db.sql
echo "FLUSH PRIVILEGES;" >> msql_db.sql

mysql < msql_db.sql

kill $(cat /var/run/mysqld/mysqld.pid)

mysqld