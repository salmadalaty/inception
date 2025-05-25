FROM debian:bullseye

RUN apt-get update -y && \
    apt-get install -y mariadb-server && \
    apt-get upgrade -y

COPY ./conf/mariadb.conf /etc/mysql/mariadb.conf.d/50-server.cnf
COPY ./tools/script.sh /

EXPOSE 3306

RUN chmod +x /script.sh

CMD ["mysqld"]
