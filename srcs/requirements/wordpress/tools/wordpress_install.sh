#!/bin/bash

if [ -f ./wp-config.php ]
then
	echo "wordpress already install"
else

	wget http://wordpress.org/latest.tar.gz
	tar xfz latest.tar.gz
	mv wordpress/* .
	rm -rf latest.tar.gz
	rm -rf wordpress

	sed -i "s/database_name_here/$DBAME/g" wp-config-sample.php
	sed -i "s/username_here/$DBUSER/g" wp-config-sample.php
	sed -i "s/password_here/$DBPWD/g" wp-config-sample.php
	sed -i "s/localhost/$DBHOST/g" wp-config-sample.php

	sed -i "s/listen =/listen = 0.0.0.0:9000/g" /etc/php/7.3/fpm/pool.d/www.conf
	mv wp-config-sample.php wp-config.php
fi

exec "$@"