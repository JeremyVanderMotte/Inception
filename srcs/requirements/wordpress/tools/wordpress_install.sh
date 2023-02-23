#!/bin/bash

	sed -i "s|listen = /run/php/php7.3-fpm.sock|listen = 9000|g" /etc/php/7.3/fpm/pool.d/www.conf

	wp core download --allow-root --path=/var/www/html/

	wp core install \
		--title=$WP_TITLE \
		--url=$WP_URL \
		--admin_user=$MARIADB_ROOT_USER \
		--admin_password=$MARIADB_ROOT_PWD \
		--admin_email=$MARIADB_ROOT_EMAIL \
		--allow-root

	wp config create \
		--dbname=$MARIADB_NAME\
		--dbuser=$MARIADB_ROOT_USER \
		--dbpass=$MARIADB_ROOT_PWD \
		--allow-root
	
	wp user create \
	--allow-root \
	${MARIADB_USER} \
	${MARIADB_USER_EMAIL} \
	--user_pass=${MARIADB_PWD};

	#wp theme install twentysixsten --activate
	
	#wget http://wordpress.org/latest.tar.gz
	#tar xfz latest.tar.gz
	#cp -R wordpress/* ./
	#rm -rf latest.tar.gz
	#rm -rf wordpress
	#sed -i "s/database_name_here/$MARIADB_NAME/g" wp-config-sample.php
	#sed -i "s/username_here/$MARIADB_USER/g" wp-config-sample.php
	#sed -i "s/password_here/$MARIADB_PWD/g" wp-config-sample.php
	#sed -i "s/localhost/$MARIADB_HOST/g" wp-config-sample.php
	#sed -i "s/define( 'WP_DEBUG', false );/define( 'WP_DEBUG', true );/g" wp-config-sample.php
	#mv wp-config-sample.php wp-config.php
	

exec "$@"