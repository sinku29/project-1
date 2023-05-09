FROM ubuntu
FROM httpd:latest

RUN apt-get update
RUN apt instll apache2 -y


COPY index.html /var/www/html/index.html

EXPOSE 80


CMD ["/usr/sbin/apache2","-D","FOREGROUND"]

