#!/bin/bash

if wp core is-installed --allow-root;
then
	echo "wordpress already install"
else

	sed -i "s|listen = /run/php/php7.3-fpm.sock|listen = 9000|g" /etc/php/7.3/fpm/pool.d/www.conf

	wp core download --allow-root

	wp config create --dbname=mariadb \
		--dbuser=jvander \
		--dbpass=1234 \
		--allow-root

	wp core install \
		--url="jvander-.42.fr" \
		--admin_user="jvander" \
		--admin_password="1234" \
		--skip-email \
		--allow-root
	#wget http://wordpress.org/latest.tar.gz
	#tar xfz latest.tar.gz
	#rm -rf latest.tar.gz

	#sed -i "s/database_name_here/$DBNAME/g" wp-config-sample.php
	#sed -i "s/username_here/$DBUSER/g" wp-config-sample.php
	#sed -i "s/password_here/$DBPWD/g" wp-config-sample.php
	#sed -i "s/localhost/$DBHOST/g" wp-config-sample.php
	##sed -i "s/define( 'WP_DEBUG', false );/define( 'WP_DEBUG', true );/g" wordpress/wp-config-sample.php
	#mv wp-config-sample.php wp-config.php
fi

exec "$@"