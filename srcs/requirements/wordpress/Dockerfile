FROM debian:bullseye

RUN apt-get update -y && apt-get upgrade -y
RUN apt-get install -y curl php7.4 php7.4-fpm php7.4-mysql php7.4-curl php7.4-gd php7.4-mbstring

RUN mkdir /scripts
RUN useradd wp_user && groupadd wp_group && usermod -aG wp_group wp_user

COPY conf/php-fpm.conf /etc/php/7.4/fpm/php-fpm.conf
COPY ./tools/wordpress.sh /scripts/wordpress.sh

RUN chmod +x /scripts/wordpress.sh

CMD ["/scripts/wordpress.sh"]