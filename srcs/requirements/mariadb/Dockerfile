# Dockerfile
FROM debian:bullseye

ARG MYSQL_DATABASE
ARG MYSQL_USER
ARG MYSQL_PASSWORD
ARG MYSQL_ROOT_PASSWORD

ENV MYSQL_DATABASE=$MYSQL_DATABASE \
    MYSQL_USER=$MYSQL_USER \
    MYSQL_PASSWORD=$MYSQL_PASSWORD \
    MYSQL_ROOT_PASSWORD=$MYSQL_ROOT_PASSWORD

# Install MariaDB
RUN apt-get update && \
    apt upgrade -y && \
    apt-get install -y mariadb-server && \
    apt-get clean && \
    rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*

# Copy the custom my.cnf if needed
COPY ./conf/50-server.cnf /etc/mysql/my.cnf

RUN mkdir -p /var/run/mysqld/
RUN chown -R mysql:mysql /var/run/mysqld/

# Expose the MySQL port
EXPOSE 3306

RUN service mariadb start && \
    echo "CREATE DATABASE IF NOT EXISTS ${MYSQL_DATABASE} ;" > msql_db.sql && \
    echo "CREATE USER IF NOT EXISTS '${MYSQL_USER}'@'%' IDENTIFIED BY '${MYSQL_PASSWORD}' ;" >> msql_db.sql && \
    echo "GRANT ALL PRIVILEGES ON ${MYSQL_DATABASE}.* TO '${MYSQL_USER}'@'%' ;" >> msql_db.sql && \
    echo "FLUSH PRIVILEGES;" >> msql_db.sql && \
    echo "ALTER USER 'root'@'localhost' IDENTIFIED BY '${MYSQL_ROOT_PASSWORD}' ;" >> msql_db.sql && \
    mariadb < msql_db.sql


# Start MariaDB service
CMD ["mysqld"]