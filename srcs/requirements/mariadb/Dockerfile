FROM debian:bullseye

RUN apt update && apt upgrade -y && \
    apt install -y mariadb-server

# Copy configuration and script
COPY ./conf/my.conf /etc/mysql/mariadb.conf.d/50-server.cnf
COPY ./tools/script.sh /

# Set permissions and socket dir
RUN chmod +x /script.sh && \
    mkdir -p /run/mysqld && \
    chown -R mysql:mysql /run/mysqld

# Set environment variables (you can also set these from docker-compose or Docker CLI)
ENV MYSQL_DATABASE=wordpress
ENV MYSQL_USER=wpuser
ENV MYSQL_PASSWORD=wppassword
ENV MYSQL_DATABASE=salma

CMD ["/script.sh"]
