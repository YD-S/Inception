#!/bin/bash

if [ ! -f /var/www/html/wp-config.php ]; then
	if ! [ -d /var/www/html ]; then
		mkdir -p /var/www/html
	fi

curl -O https://raw.githubusercontent.com/wp-cli/builds/gh-pages/phar/wp-cli.phar
chmod +x wp-cli.phar
mv wp-cli.phar /usr/local/bin/wp
wp core download --allow-root --path=/var/www/html
mv /var/www/html/wp-config-sample.php /var/www/html/wp-config.php

sed -i "s/database_name_here/$DB_NAME/g" /var/www/html/wp-config.php
sed -i "s/username_here/$DB_USER/g" /var/www/html/wp-config.php
sed -i "s/password_here/$DB_PASSWORD/g" /var/www/html/wp-config.php
sed -i "s/localhost/$DB_HOST/g" /var/www/html/wp-config.php
wp core install --allow-root --path=/var/www/html \
	--url=$WP_URL --title=$WP_TITLE \
	--admin_user=$WP_USER --admin_password=$WP_PASSWORD \
	--admin_email=$WP_EMAIL
wp user create $DB_USER $DB_USER_EMAIL --user_pass=$DB_PASSWORD --allow-root --role=author --path=/var/www/html

fi

chown -R wp_user:wp_group /var/www/html && chmod -R 775 /var/www/html
php-fpm7.4 -y /etc/php/7.4/fpm/php-fpm.conf -F
