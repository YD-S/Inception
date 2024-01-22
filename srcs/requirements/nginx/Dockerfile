FROM debian:bullseye
RUN apt-get update && apt-get upgrade -y
RUN apt-get install -y nginx openssl

RUN mkdir -p /etc/nginx/ssl
RUN openssl req -x509 -nodes -days 365 -newkey rsa:2048 -subj "/CN=ysingh.42.fr/C=ES/L=Malaga" -keyout /etc/nginx/ssl/server.key -out /etc/nginx/ssl/server.crt
COPY conf/nginx.conf /etc/nginx/sites-available/default
EXPOSE 443
CMD ["nginx", "-g", "daemon off;"]