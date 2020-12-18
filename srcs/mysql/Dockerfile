FROM alpine

COPY /my.cnf /etc/mysql/
COPY onload.sh start.sql /

RUN apk update; apk upgrade;
RUN apk add mariadb;
RUN apk add mysql-client;

VOLUME	/var/lib/mysql

EXPOSE 3306

CMD /onload.sh
