#change before push
FROM debian:latest

WORKDIR /tmp/inception/mariadb

COPY ./data .

RUN apt-get update && apt-get upgrade -y \
	&& apt-get install mariadb-server -y

#cleaning tmp
RUN rm -rf /tmp/inception/wordpress

#CMD echo "mariadb dockefile"
CMD sleep infinity