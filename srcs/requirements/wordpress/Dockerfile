FROM debian:buster

RUN apt-get update -y && apt-get upgrade -y
RUN apt-get install -y curl php7.3 php7.3-fpm php7.3-mysql php7.3-curl php7.3-gd php7.3-mbstring

RUN mkdir /scripts
RUN useradd wp_user && groupadd wp_group && usermod -aG wp_group wp_user

COPY conf/php-fpm.conf /etc/php/7.3/fpm/php-fpm.conf
COPY ./tools/wordpress.sh /scripts/wordpress.sh

RUN chmod +x /scripts/wordpress.sh

CMD ["/scripts/wordpress.sh"]