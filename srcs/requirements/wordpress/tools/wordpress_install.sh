#!/bin/bash

	#Change le port d'écoute dePHP-FPM
	sed -i "s|listen = /run/php/php7.3-fpm.sock|listen = 9000|g" /etc/php/7.3/fpm/pool.d/www.conf

if [ -f ./wp-config.php ]
then
	echo "Wordpress is already installed and configured"
else
	#Download wordpress dans le path spécifié
	wp core download --allow-root --path=/var/www/html/

	#Remplace les variable nécéssaire à la configuration de wordpress
	#Cela permet d'éviter la page de configuration de wordpress
	#On modifie les valeurs dans le fichier de sample avant de modifier son nom en wp-config.php
	sed -i "s/database_name_here/$MARIADB_NAME/g" wp-config-sample.php
	sed -i "s/username_here/$WP_ROOT_USER/g" wp-config-sample.php
	sed -i "s/password_here/$WP_ROOT_PWD/g" wp-config-sample.php
	sed -i "s/localhost/$MARIADB_HOST/g" wp-config-sample.php
	mv wp-config-sample.php wp-config.php

	#Commande pour installer wordpress via le wp-config.php
	wp core install \
		--title=$WP_TITLE \
		--url=$WP_URL \
		--admin_user=$WP_ROOT_USER \
		--admin_password=$WP_ROOT_PWD \
		--admin_email=$WP_ROOT_EMAIL \
		--allow-root

	#Création d'un nouvel utilisateur autre que le root
	wp user create --allow-root \
		$WP_USER \
		$WP_USER_EMAIL \
		--user_pass=$WP_USER_PASSWORD

	#Installation d'un nouveau thème plus joli
	#wp theme install hestia --activate --allow-root
fi

php-fpm7.3 --nodaemonize