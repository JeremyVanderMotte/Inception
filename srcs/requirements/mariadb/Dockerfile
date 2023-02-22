FROM debian:buster

RUN apt-get update && \
	apt-get install -y \
	mariadb-server

##change line chmod 777 for more security
##RUN mkdir -p /var/run/mysqld && \
##	chown -R mysql:mysql /var/run/mysqld && \
##	chmod 777 /var/run/mysqld

#EXPOSE 3306

#COPY ./tools/create_database.sql /usr/local/bin/
#COPY ./tools/install_mariadb.sh /usr/local/bin/
#RUN chmod +x /usr/local/bin/create_database.sql 
#RUN chmod +x /usr/local/bin/install_mariadb.sh

##RUN chmod -R 755 /var/lib/mysql/

##COPY tools/mariadb.cnf /etc/mysql/

#ENTRYPOINT [ "/usr/local/bin/install_mariadb.sh" ]

##CMD ["mysqld", "--bind-adress=0.0.0.0"]

COPY ./tools/create_database.sql /tmp/create_database.sql

#je vais devoir copie des trucs (COPY)
COPY tools/install_mariadb.sh /tmp

#copie le document de config pour remplacer celui normalement déjà présent 
COPY conf/mariadb.cnf /etc/mysql/

#Je vais devoir finir par la cmd ENTRYPOINT pour lancer les scripts qui feront la configurations du service pendant que le service tourne. 
ENTRYPOINT ["sh", "/tmp/install_mariadb.sh"]