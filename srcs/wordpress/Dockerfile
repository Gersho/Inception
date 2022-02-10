#change before push
FROM debian:latest

WORKDIR /tmp/inception/wordpress

COPY ./data .

RUN apt-get update && apt-get upgrade -y \
	&& apt-get install php-fpm php-mysql php-mbstring php-zip php-gd php-xml php-pear php-cgi -y 

RUN sh build_wp-config.php.sh

RUN mkdir /var/inception_wordpress \
	&& tar xzf wordpress-5.9.tar.gz -C /var/inception_wordpress \
	&& rm -f /var/inception_wordpress/wordpress/wp-config.php \
	&& cp wp-config2.php /var/inception_wordpress/wordpress\
	&& chown -R www-data:www-data /var/inception_wordpress/wordpress

#cleaning tmp
RUN rm -rf /tmp/inception/wordpress

CMD echo "wordpress dockerfile"
