FROM debian:buster

RUN apt-get update && apt-get upgrade -y

RUN apt-get install nginx openssl nano -y

WORKDIR /tmp/inception/nginx
COPY ./data .

ARG DOMAIN_NAME=$DOMAIN_NAME

RUN mkdir -p /etc/nginx/certificate \
	&& openssl req -new -newkey rsa:4096 -x509 -sha256 -days 365 -nodes -subj "/C=US/ST=Denial/L=Springfield/O=Dis/CN=www.kzennoun.42.fr" -out /etc/nginx/certificate/nginx-certificate.crt -keyout /etc/nginx/certificate/nginx.key \
	&& sh nginx_build.sh \
	&& rm -f /etc/nginx/sites-available/default \
	&& cp default /etc/nginx/sites-available/default

WORKDIR /
RUN rm -rf /tmp/inception

ENTRYPOINT ["nginx", "-g", "daemon off;"]
