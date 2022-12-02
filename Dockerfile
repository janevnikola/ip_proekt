FROM php:7.4-apache
COPY src/ /var/www/html/ 
RUN echo "ServerName localhost" >> /etc/apache2/apache2.conf
RUN service apache2 restart
#Where src/ is the directory containing all your PHP code. Then, run the commands to build and run the Docker image:
