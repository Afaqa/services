FROM alpine

COPY srcs/vsftpd.conf /etc/

RUN apk update; apk upgrade;
RUN apk add openssl;
RUN apk add vsftpd;
RUN apk add supervisor;
RUN openssl req -x509 -newkey rsa:4096 -keyout /etc/ssl/ftp.key \
    -out /etc/ssl/ftp.crt -days 365 -nodes -subj '/CN=itressa';
RUN addgroup itressa;
RUN (echo service; echo service) | adduser -h/home/itressa -G itressa itressa;
RUN (echo service; echo service) | passwd root;

COPY srcs/supervisord.conf /etc/

EXPOSE 21 2142

CMD supervisord
