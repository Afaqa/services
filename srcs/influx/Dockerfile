FROM alpine

COPY ./onload.sh /var/
COPY ./influxdb-1.8.3.tar.gz /

RUN apk update; apk upgrade;

ADD https://alpine-pkgs.sgerrand.com/sgerrand.rsa.pub /etc/apk/keys/sgerrand.rsa.pub
ADD https://github.com/sgerrand/alpine-pkg-glibc/releases/download/2.32-r0/glibc-2.32-r0.apk /glibc-2.32-r0.apk
RUN apk add glibc-2.32-r0.apk;

RUN tar xfz influxdb-1.8.3.tar.gz; \
cp -r /influxdb-1.8.3-1/* /; \
rm -rf influxdb-1.8.3-1/ influxdb-1.8.3.tar.gz; \
wget https://dl.influxdata.com/telegraf/releases/telegraf-1.17.0_linux_amd64.tar.gz; \
tar xf telegraf-1.17.0_linux_amd64.tar.gz; \
cp -r /telegraf-1.17.0/* /; \
rm -rf telegraf-1.17.0_linux_amd64.tar.gz /telegraf-1.17.0/;

VOLUME	/var/lib/influxdb

EXPOSE 8086

CMD /var/onload.sh
