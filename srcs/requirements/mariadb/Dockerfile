FROM debian:bullseye

RUN apt update -y && \
    apt upgrade -y && \
    apt-get install mariadb-server -y 

COPY ./conf/my.conf /etc/mysql/mariadb.conf.d/50-server.cnf
COPY ./tools/start.sh /

RUN chmod +x /start.sh

CMD ["/start.sh"]

