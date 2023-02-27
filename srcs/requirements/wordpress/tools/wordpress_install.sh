#!/bin/bash

	#Change the listen part for php to listen to wordpress
	sed -i "s|listen = /run/php/php7.3-fpm.sock|listen = 9000|g" /etc/php/7.3/fpm/pool.d/www.conf

if [ -f ./wp-config.php ]
then
	echo "Wordpress is already installed and configured"
else
	#Downloading wordpress in path specified
	wp core download --allow-root --path=/var/www/html/

	sed -i "s/database_name_here/$MARIADB_NAME/g" wp-config-sample.php
	sed -i "s/username_here/$WP_ROOT_USER/g" wp-config-sample.php
	sed -i "s/password_here/$WP_ROOT_PWD/g" wp-config-sample.php
	sed -i "s/localhost/$MARIADB_HOST/g" wp-config-sample.php
	sed -i "s/define( 'WP_DEBUG', false );/define( 'WP_DEBUG', true );/g" wp-config-sample.php
	mv wp-config-sample.php wp-config.php

	#Command use to skip the installation page 
	# on wordpress.
	wp core install \
		--title=$WP_TITLE \
		--url=$WP_URL \
		--admin_user=$WP_ROOT_USER \
		--admin_password=$WP_ROOT_PWD \
		--admin_email=$WP_ROOT_EMAIL \
		--allow-root

	#Command used to create the wp-config.php
	# to skip the config page.
	#wp config create \
	#	--dbname=$MARIADB_NAME\
	#	--dbuser=$WP_ROOT_USER \
	#	--dbpass=$WP_ROOT_PWD \
	#	--dbhost=$MARIADB_HOST \
	#	--allow-root
	
	#Command to create a new user in wordpress
	wp user create \
	--allow-root \
	$WP_USER \
	$WP_USER_EMAIL \
	--user_pass=$WP_USER_PASSWORD

	#Install a new theme prettier of the default one.
	wp theme install hestia --activate --allow-root
fi
exec "$@"