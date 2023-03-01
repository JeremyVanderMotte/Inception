#Si la DB existe déjà on ne la recrée pas  
if [ -d /var/lib/mysql/$MARIADB_NAME ]; then
	echo "DB $MARIADB_NAME already created..."
else
	#On lance mysql dans le dossier défini par datadir pour le configurer
	service mysql start --datadir=/var/lib/mysql

	#Crée la base de donnée avec un user root
	eval "echo \"$(cat /tmp/create_database.sql)\"" | mariadb -u root

	#Set un password pour l'utilisateur root
	mysqladmin -u root password $WP_ROOT_PWD;

	#Stop le service mysql
	service mysql stop --datadir=/var/lib/mysql
fi

#Lance le service en mode safe.
mysqld_safe --datadir=/var/lib/mysql
