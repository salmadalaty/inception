FROM debian:bullseye

RUN apt-get update && \
    apt-get install -y wget #Install wget for downloading files

RUN mkdir /var/www
RUN apt-get install -y php7.4 php7.4-fpm php7.4-mysql

RUN apt-get install -y mariadb-client && apt install curl -y

COPY ./tools/script.sh /
RUN chmod +x script.sh

CMD ["/script.sh"]