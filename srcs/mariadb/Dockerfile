#change before push
FROM debian:buster

EXPOSE 3306

RUN apt-get update && apt-get upgrade -y

WORKDIR /tmp/inception/mariadb
COPY ./data .

RUN apt-get install mariadb-server procps expect nano -y

ARG SQL_NAME=$SQL_NAME
ARG SQL_USER=$SQL_USER
ARG SQL_PASS=$SQL_PASS
ARG SQL_HOST=$SQL_HOST

RUN cp 51.cnf /etc/mysql/mariadb.conf.d/
RUN sh sql_build.sh

#cleaning tmp
#RUN rm -rf /tmp/inception/mariadb

#CMD echo "mariadb dockefile"
CMD mysqld_safe