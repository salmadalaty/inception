FROM debian:bullseye

RUN apt-get update && \
    apt-get install -y wget php7.4 php7.4-fpm php7.4-mysql mariadb-client curl

RUN mkdir -p /var/www/html

COPY ./tools/script.sh /
RUN chmod +x /script.sh

CMD ["/script.sh"]
