FROM alpine

COPY /my.cnf ./etc/mysql/
COPY initdb.sh onload.sh start.sql /

RUN adduser -D -g 'mysql' mysql

RUN apk update; apk --no-cache upgrade; \
apk add --no-cache mysql mysql-client
# RUN apk add mariadb mysql-client

# create database
#RUN sh /initdb.sh

VOLUME	/var/lib/mysql

EXPOSE 3306

ENTRYPOINT /onload.sh
