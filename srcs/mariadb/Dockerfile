FROM debian:buster

RUN apt-get update && apt-get upgrade -y

RUN apt-get install mariadb-server procps expect nano -y

WORKDIR /tmp/inception/mariadb
COPY ./data .
EXPOSE 3306

ARG SQL_NAME=$SQL_NAME
ARG SQL_USER=$SQL_USER
ARG SQL_PASS=$SQL_PASS
ARG SQL_HOST=$SQL_HOST
ARG SQL_ROOTPASS=$SQL_ROOTPASS

RUN cp 51.cnf /etc/mysql/mariadb.conf.d/
RUN sh sql_build.sh

CMD mysqld