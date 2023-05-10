# Use a base image
FROM ubuntu:latest

# Update the package repository
RUN apt-get update

# Install Apache and PHP
RUN apt-get install -y apache2 php

# Copy the website files to the container
COPY index.php /var/www/html/

# Expose port 80
EXPOSE 80

# Start Apache in the foreground
CMD ["apache2ctl", "-D", "FOREGROUND"]
