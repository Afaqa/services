FROM alpine

RUN apk update; apk upgrade;

RUN wget -O /etc/apk/keys/sgerrand.rsa.pub https://alpine-pkgs.sgerrand.com/sgerrand.rsa.pub; \
wget https://github.com/sgerrand/alpine-pkg-glibc/releases/download/2.32-r0/glibc-2.32-r0.apk; \
apk add glibc-2.32-r0.apk;

RUN wget https://dl.grafana.com/oss/release/grafana-7.3.6.linux-amd64.tar.gz; \
tar -zxf grafana-7.3.6.linux-amd64.tar.gz; rm grafana-7.3.6.linux-amd64.tar.gz;

WORKDIR /grafana-7.3.6

COPY grafana.db data/

EXPOSE 3000

CMD /grafana-7.3.6/bin/grafana-server
