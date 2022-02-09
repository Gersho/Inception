FROM alpine:latest  
# CHANGE BEFORE PUSH TO PENULTIMATE

WORKDIR /tmp/test

#RUN apk update && apt-get upgrade -y \
RUN	apk add nginx openssl


RUN mkdir /etc/nginx/certificate \
	&& openssl req -new -newkey rsa:4096 -x509 -sha256 -days 365 -nodes -subj "/C=US/ST=Denial/L=Springfield/O=Dis/CN=www.example.com" -out /etc/nginx/certificate/nginx-certificate.crt -keyout /etc/nginx/certificate/nginx.key 

#COPY ./data .
COPY		data/nginx.sh nginx.sh
RUN			rm -f /etc/nginx/nginx.conf
COPY		data/nginx.conf /etc/nginx/nginx.conf
COPY		data/index.html /var/www/html/index.html

RUN			chmod -R +x nginx.sh
EXPOSE 443


#CMD ls
#CMD pwd
CMD ash nginx.sh
#ENTRYPOINT	["sh", "nginx.sh"]
#ENTRYPOINT	["ls", "-al"]
#ENTRYPOINT ["sleep", "infinity"]