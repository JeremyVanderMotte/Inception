FROM debian:buster

RUN	apt-get update && \
	apt-get install -y nginx \
	openssl

RUN mkdir -p /etc/nginx/ssl/

# x509 : self sign the certificate
# rsa:4096 : construct RSA keys
# sha256 : Type of encryption
# days 365 : valid for one year
# subj : Use to give default values for creating key
RUN openssl req -x509 -nodes \
	-out /etc/nginx/ssl/self-signed-cert.crt \
	-keyout /etc/nginx/ssl/self-signed-key.key \
	-subj "/C=BE/ST=Bruxelles/L=Bruxelles/O=42/OU=19/CN=jvander"

RUN mkdir -p /run/nginx/
COPY conf/nginx.conf /etc/nginx/conf.d/default.conf

WORKDIR /var/www/wordpress/

EXPOSE 443

CMD ["nginx", "-g", "daemon off;"]