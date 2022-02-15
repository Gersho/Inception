#change before push
FROM debian:latest


RUN apt-get update && apt-get upgrade -y

WORKDIR /tmp/inception/wordpress

RUN apt-get install php-fpm php-mysql php-mbstring php-zip php-gd php-xml php-pear php-cgi nano -y 

COPY ./data .

RUN mkdir /var/inception_wordpress \
	&& tar xzf wordpress-5.9.tar.gz -C /var/inception_wordpress \
	&& rm -f /var/inception_wordpress/wordpress/wp-config.php \
	&& chown -R www-data:www-data /var/inception_wordpress/wordpress
#	&& cp wp-config2.php /var/inception_wordpress/wordpress\

#cleaning tmp
#RUN rm -rf /tmp/inception/wordpress

#CMD echo "wordpress dockerfile"
CMD sh build_wp-config.php.sh