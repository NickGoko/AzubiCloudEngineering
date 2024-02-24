# Use the official PHP and Apache image
FROM php:7.4-apache

# Update package lists and upgrade installed packages
RUN apt-get update && apt-get upgrade -y

# Copy the PHP files into the web server directory
COPY login.php /var/www/html/

# Expose port 80 to the outside world
EXPOSE 80
