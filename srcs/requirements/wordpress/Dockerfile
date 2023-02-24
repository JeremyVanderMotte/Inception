FROM debian:buster

RUN apt-get update && \
	apt-get install -y \
	curl \
	#php7.3 \
	php7.3-fpm \
	php7.3-mysql

RUN mkdir -p /run/php/


#Download wordpress CLI to install wordpress
# and skip the config page.
RUN curl -O https://raw.githubusercontent.com/wp-cli/builds/gh-pages/phar/wp-cli.phar && \
	chmod +x wp-cli.phar && \
	mv wp-cli.phar /usr/local/bin/wp

WORKDIR /var/www/html/

#Install wordpress by the script and configure it.
COPY ./tools/wordpress_install.sh /usr/local/bin
RUN chmod +x /usr/local/bin/wordpress_install.sh
ENTRYPOINT ["/usr/local/bin/wordpress_install.sh"]


EXPOSE 9000

CMD ["/usr/sbin/php-fpm7.3", "-F"]


