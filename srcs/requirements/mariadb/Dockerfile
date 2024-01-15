FROM debian:bullseye

RUN apt update && apt upgrade -y
RUN apt install -y mariadb-server

RUN mkdir -p /run/mysqld

COPY ./conf/50-server.cnf /etc/mysql/mariadb.conf.d/

COPY ./tools/mysql.sh /

RUN chmod +x /mysql.sh

RUN chown -R mysql:mysql /run/mysqld/

EXPOSE 3306

CMD ["/mysql.sh"]