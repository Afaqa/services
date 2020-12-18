FROM alpine

COPY /my.cnf /etc/mysql/
COPY onload.sh start.sql /

RUN apk update; apk upgrade;

RUN wget -O /etc/apk/keys/sgerrand.rsa.pub https://alpine-pkgs.sgerrand.com/sgerrand.rsa.pub; \
wget https://github.com/sgerrand/alpine-pkg-glibc/releases/download/2.32-r0/glibc-2.32-r0.apk; \
apk add glibc-2.32-r0.apk;

RUN wget https://dl.influxdata.com/influxdb/releases/influxdb2_client_2.0.3_linux_arm64.tar.gz
tar xvfz influxdb2_client_2.0.3_linux_arm64.tar.gz

VOLUME	/var/lib/influx

EXPOSE 8086

CMD /onload.sh
