# Use a base image
FROM ubuntu:latest

# Update the package repository
RUN apt update

# Install Apache and PHP
RUN apt install -y apache2 

# Copy the website files to the container
COPY index.html /var/www/html/

# Expose port 80
EXPOSE 80

# Start Apache in the foreground
CMD ["/usr/sbin/apache2ctl", "-D", "FOREGROUND"]
