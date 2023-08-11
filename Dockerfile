FROM centos:7
RUN yum update -y && yum install -y httpd
RUN yum install -y zip
RUN yum install -y unzip
COPY loxury /var/www/html/
WORKDIR	 /var/www/html
CMD ["/usr/sbin/httpd", "-D", "FOREGROUND"]
EXPOSE 80