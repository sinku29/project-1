FROM centos:latest
RUN yum update -y && yum install -y httpd
RUN yum install -y zip 
RUN yum install -y unzip
ADD https://www.free-css.com/assets/files/free-css-templates/download/page258/loxury.zip /var/www/html/
WORKDIR	 /var/www/html
RUN unzip loxury.zip
RUN cp -rvp loxury/* .
RUN rm -rf loxury loxury.zip
CMD ["/usr/sbin/httpd", "-D", "FOREGROUND"]
EXPOSE 80
