FROM alpine

COPY ./onload.sh /var/

RUN apk update; apk upgrade;

RUN wget -O /etc/apk/keys/sgerrand.rsa.pub https://alpine-pkgs.sgerrand.com/sgerrand.rsa.pub; \
wget https://github.com/sgerrand/alpine-pkg-glibc/releases/download/2.32-r0/glibc-2.32-r0.apk; \
apk add glibc-2.32-r0.apk;

RUN wget https://dl.influxdata.com/influxdb/releases/influxdb2-2.0.3_linux_amd64.tar.gz; \
tar xfz influxdb2-2.0.3_linux_amd64.tar.gz; \
chmod +x influxdb2-2.0.3_linux_amd64/influx*; \
mv influxdb2-2.0.3_linux_amd64/influx* /usr/bin; \
rm -rf influxdb2-2.0.3_linux_amd64/ influxdb2_client_2.0.3_linux_amd64.tar.gz; \
wget https://dl.influxdata.com/telegraf/releases/telegraf-1.17.0_linux_amd64.tar.gz; \
tar xf telegraf-1.17.0_linux_amd64.tar.gz; \
cp -r /telegraf-1.17.0/* /; \
chmod +x telegraf-1.17.0/usr/bin/telegraf; \
rm -f telegraf-1.17.0_linux_amd64.tar.gz; \
/telegraf-1.17.0/usr/bin/telegraf --input-filter docker --output-filter influxdb_v2 config > /telegraf-1.17.0/telegraf.conf;
#mv telegraf-1.17.0_linux_amd64/influx* /usr/bin; \
#rm -rf telegraf-1.17.0_linux_amd64/ telegraf-1.17.0_linux_amd64.tar.gz; \

VOLUME	/var/lib/influx

EXPOSE 8086

CMD /var/onload.sh
