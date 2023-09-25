#!/bin/bash

service mysql start 

echo "CREATE DATABASE IF NOT EXISTS mariadb ;" > msql_db.sql
echo "CREATE USER IF NOT EXISTS 'ysingh'@'%' IDENTIFIED BY '1234' ;" >> msql_db.sql
echo "GRANT ALL PRIVILEGES ON mariadb.* TO 'ysingh'@'%' ;" >> msql_db.sql
echo "FLUSH PRIVILEGES;" >> msql_db.sql
echo "ALTER USER 'root'@'localhost' IDENTIFIED BY '12345' ;" >> msql_db.sql

mysql < msql_db.sql

