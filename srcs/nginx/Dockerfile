#change before push
FROM debian:latest

WORKDIR /tmp/inception/nginx

COPY ./data .

RUN apt-get update && apt-get upgrade -y \
	&& apt-get install nginx openssl -y \
	&& mkdir /etc/nginx/certificate \
	&& openssl req -new -newkey rsa:4096 -x509 -sha256 -days 365 -nodes -subj "/C=US/ST=Denial/L=Springfield/O=Dis/CN=www.kzennoun.42.fr" -out /etc/nginx/certificate/nginx-certificate.crt -keyout /etc/nginx/certificate/nginx.key 
	# && chown -R www-data:www-data /var/www/html \
	# && chmod 755 /var/www/html \

RUN sh build_nginx_conf.sh \
	&& rm -f /etc/nginx/sites-available/default \
	&& cp default /etc/nginx/sites-available/default

#cleaning tmp
RUN rm -rf /tmp/inception/nginx

ENTRYPOINT ["nginx", "-g", "daemon off;"]
