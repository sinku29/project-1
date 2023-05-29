FROM ubuntu
RUN apt update && apt upgrade -y
RUN apt install apache2
RUN apt install unzip -y
ADD https://www.free-css.com/assets/files/free-css-templates/download/page254/photogenic.zip  /var/www/html/
WORKDIR /var/www/html
RUN unzip photogenic.zip
RUN cp -rf photogenic/*  .
RUN rm -rf photogenic photogenic.zip
CMD ["apachectl", "-D", "FOREGROUND"]
EXPOSE 80
