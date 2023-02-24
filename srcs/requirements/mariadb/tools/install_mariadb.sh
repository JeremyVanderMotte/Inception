#Change les droits du dossier et des sous dossier pour y avoir accès
chown -R mysql:mysql /var/lib/mysql

#Si la DB existe déjà on ne la recrée aps  
if [ ! -d /var/lib/mysql/$MARIADB_NAME ]; then

	#On lance mysql dans le dossier défini par datadir pour le configurer
	service mysql start --datadir=/var/lib/mysql

	#Crétion du dossier pour lancer mysqld
	mkdir -p /var/run/mysqld

	#Une fois les dossiers requis créer on va aussi s'assurer que les documents requis sont
	#présent. touch va créer un document vide par définition. 
	#touch /var/run/mysqld/mysqlf.pid

	#Lance le script pour créer la DB et un user root
	eval "echo \"$(cat /tmp/create_database.sql)\"" | mariadb -u root

	#Il faut protéger le root de mysql car on veut que l'user créer précédemment ait accès 
	#à la database créé mais pas à toutes les databases.
	#mysqladmin -u root password $WP_ROOT_PWD;

	
	service mysql stop --datadir=/var/lib/mysql
else
	#On crée un dossier qui va être utiliser par le daemon (le daemon stock toutes les infos
	#qui vont communiqué ensemble entre les sewrvices dans un même dossier)
	#mkdir -p /var/run/mysqld
	echo "DB $MARIADB_NAME already created..."
fi

#chown -R mysql:mysql /var/run/mysqld
#On lance mysql dans le dossier où on l'a installé avant.
mysqld_safe --datadir=/var/lib/mysql
