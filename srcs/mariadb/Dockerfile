#change before push
FROM debian:buster


RUN apt-get update && apt-get upgrade -y

WORKDIR /tmp/inception/mariadb

RUN apt-get install mariadb-server expect nano -y

COPY ./data .
#cleaning tmp
#RUN rm -rf /tmp/inception/mariadb

#CMD echo "mariadb dockefile"
CMD sh sql_build.sh