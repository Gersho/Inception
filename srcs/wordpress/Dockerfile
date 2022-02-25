FROM debian:buster

RUN apt-get update && apt-get upgrade -y

RUN apt-get install php7.3-fpm php-mysql php-mbstring php-zip php-gd php-xml php-pear php-cgi nano -y 

WORKDIR /tmp/inception/wordpress
COPY ./data .
EXPOSE 9000

ARG SQL_NAME=$SQL_NAME
ARG SQL_USER=$SQL_USER
ARG SQL_PASS=$SQL_PASS
ARG SQL_HOST=$SQL_HOST

RUN mkdir /var/inception_wordpress \
	&& tar xzf wordpress-5.9.tar.gz -C /var/inception_wordpress \
	&& rm -f /var/inception_wordpress/wordpress/wp-config.php \
	&& chown -R www-data:www-data /var/inception_wordpress/wordpress

RUN chmod +x wp-cli.phar \
	&& mv wp-cli.phar /bin/wp \
	&& sh build_wp-config.php.sh

CMD sh run.sh