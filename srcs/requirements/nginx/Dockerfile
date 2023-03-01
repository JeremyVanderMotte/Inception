FROM debian:buster

RUN	apt-get update && \
	apt-get install -y nginx \
	openssl

#Crée le dossier où seront stockés mon certificat et ma clé SSL
RUN mkdir -p /etc/nginx/ssl/

# x509 : Certificat auto signé
# subj : Donnes les valeurs nécéssaires pour créer la clé
RUN openssl req -x509 -nodes \
	-out /etc/nginx/ssl/self-signed-cert.crt \
	-keyout /etc/nginx/ssl/self-signed-key.key \
	-subj "/C=BE/ST=Bruxelles/L=Bruxelles/O=42/OU=19/CN=jvander-"

#Crée le dossier requis pour faire tourner nginx
RUN mkdir -p /run/nginx/

#Remplace la configuration de base de NGINX par la mienne
COPY conf/nginx.conf /etc/nginx/conf.d/default.conf

WORKDIR /var/www/html/

EXPOSE 443

CMD ["nginx", "-g", "daemon off;"]