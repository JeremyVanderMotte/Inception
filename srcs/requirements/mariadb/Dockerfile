FROM debian:buster

RUN apt-get update && \
	apt-get install -y \
	mariadb-server

COPY ./tools/create_database.sql /tmp/create_database.sql

#je vais devoir copie des trucs (COPY)
COPY tools/install_mariadb.sh /tmp
 
#copie le document de config pour remplacer celui normalement déjà présent 
COPY conf/mariadb.cnf /etc/mysql/
#RUN rm /etc/mysql/mariadb.cnf
#Je vais devoir finir par la cmd ENTRYPOINT pour lancer les scripts qui feront la configurations du service pendant que le service tourne. 
ENTRYPOINT ["sh", "/tmp/install_mariadb.sh"]

#CMD [ "mysqld", "--bind-address=0.0.0.0" ]