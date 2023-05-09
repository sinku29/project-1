FROM ubuntu

#install httpd (web server)
RUN apt update
RUN apt instll apache2 -y

# home page copy from /home/index.html
COPY index.html /var/www/html/index.html

EXPOSE 80

#start web server
CMD ["/usr/sbin/apache2","-D","FOREGROUND"]

