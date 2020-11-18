FROM alpine

COPY initdb.sh onload.sh /

RUN apk add mariadb mysql-client

# create database
RUN sh /initdb.sh

CMD sh /onload.sh
