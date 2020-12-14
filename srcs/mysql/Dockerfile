FROM alpine

COPY /my.cnf ./etc/mysql/
COPY initdb.sh onload.sh /

RUN apk add mariadb mysql-client

# create database
#RUN sh /initdb.sh

VOLUME	/var/lib/mysql

CMD sh /onload.sh
