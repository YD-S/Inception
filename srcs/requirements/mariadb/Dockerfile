FROM debian:bullseye

ARG MYSQL_DATABASE
ARG MYSQL_USER
ARG MYSQL_PASSWORD
ARG MYSQL_ROOT_PASSWORD

ENV MYSQL_DATABASE=$MYSQL_DATABASE \
    MYSQL_USER=$MYSQL_USER \
    MYSQL_PASSWORD=$MYSQL_PASSWORD \
    MYSQL_ROOT_PASSWORD=$MYSQL_ROOT_PASSWORD

RUN apt-get update
RUN apt upgrade -y
RUN apt-get install -y mariadb-server
RUN apt-get clean
RUN rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*

COPY ./conf/50-server.cnf /etc/mysql/my.cnf

RUN mkdir -p /var/run/mysqld/

RUN chown -R mysql:mysql /var/run/mysqld/

RUN service mariadb start && \
    echo "CREATE DATABASE IF NOT EXISTS ${MYSQL_DATABASE} ;" > db.sql && \
    echo "CREATE USER IF NOT EXISTS '${MYSQL_USER}'@'%' IDENTIFIED BY '${MYSQL_PASSWORD}' ;" >> db.sql && \
    echo "GRANT ALL PRIVILEGES ON ${MYSQL_DATABASE}.* TO '${MYSQL_USER}'@'%' ;" >> db.sql && \
    echo "FLUSH PRIVILEGES;" >> db.sql && \
    echo "ALTER USER 'root'@'localhost' IDENTIFIED BY '${MYSQL_ROOT_PASSWORD}' ;" >> db.sql && \
    mariadb < db.sql

CMD ["mysqld"]