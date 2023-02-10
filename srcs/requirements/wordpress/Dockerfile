FROM debian:buster

RUN apt-get update && \
	apt-get install -y \
	curl \
	wget \
	bash \
	php7.3 \
	php7.3-fpm

# COPY ./conf/www.conf php/7.4/fpm/pool.d

RUN mkdir -p /run/php/

#WORDPRESS CLI
RUN curl -O https://raw.githubusercontent.com/wp-cli/builds/gh-pages/phar/wp-cli.phar && \
	chmod +x wp-cli.phar && \
	mv wp-cli.phar /usr/local/bin/wp

WORKDIR /var/www/html/

#Install wordpress
COPY ./tools/wordpress_install.sh /usr/local/bin
RUN chmod +x /usr/local/bin/wordpress_install.sh
ENTRYPOINT ["/usr/local/bin/wordpress_install.sh"]


EXPOSE 9000

CMD ["/usr/sbin/php-fpm7.3", "-F"]


