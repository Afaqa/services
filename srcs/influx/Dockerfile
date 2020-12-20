FROM alpine

RUN apk update; apk upgrade;

RUN wget -O /etc/apk/keys/sgerrand.rsa.pub https://alpine-pkgs.sgerrand.com/sgerrand.rsa.pub; \
wget https://github.com/sgerrand/alpine-pkg-glibc/releases/download/2.32-r0/glibc-2.32-r0.apk; \
apk add glibc-2.32-r0.apk;

RUN wget https://dl.influxdata.com/influxdb/releases/influxdb2-2.0.3_linux_amd64.tar.gz; \
tar xfz influxdb2-2.0.3_linux_amd64.tar.gz; \
chmod +x influxdb2-2.0.3_linux_amd64/influx*; \
mv influxdb2-2.0.3_linux_amd64/influx* /usr/bin; \
rm -rf influxdb2-2.0.3_linux_amd64/ influxdb2_client_2.0.3_linux_amd64.tar.gz;

RUN influx setup -uadmin -badminb -oadmino -padmin007 -r0 -f

VOLUME	/var/lib/influx

EXPOSE 8086

CMD influxd
