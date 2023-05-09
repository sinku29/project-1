FROM nginx:latest

# Copy the configuration file to the container
COPY nginx.conf /etc/nginx/nginx.conf

# Copy the HTML files to the container
COPY html/ /usr/share/nginx/html/

# Expose port 80 to allow incoming HTTP traffic
EXPOSE 80
