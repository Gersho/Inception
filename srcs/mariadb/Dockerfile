#change before push
FROM debian:latest

WORKDIR /tmp/inception/mariadb


RUN apt-get update && apt-get upgrade -y \
	&& apt-get install mariadb-server expect nano -y

COPY ./data .
#cleaning tmp
#RUN rm -rf /tmp/inception/mariadb

#CMD echo "mariadb dockefile"
CMD sh sql_build.sh