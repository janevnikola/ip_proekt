FROM php:7.4-apache
COPY ./php /var/www/html/

RUN echo "ServerName 127.0.0.1" >> /etc/apache2/apache2.conf
RUN service apache2 restart
RUN apt update -y
RUN apt upgrade -y
RUN apt install nano -y
RUN apt install git -y
#RUN git clone https://github.com/moodle/moodle.git
#RUN mkdir /var/www/html/moodle
#RUN chmod 777 /var/www/html/moodle

RUN echo "<VirtualHost *:80>" > /etc/apache2/sites-available/000-default.conf
RUN echo "ServerAdmin admin@example.com" >> /etc/apache2/sites-available/000-default.conf
RUN echo "DocumentRoot /var/www/html/moodle/" >> /etc/apache2/sites-available/000-default.conf
RUN echo "ServerName example.com" >> /etc/apache2/sites-available/000-default.conf
RUN echo "ServerAlias www.example.com" >> /etc/apache2/sites-available/000-default.conf

RUN echo "<Directory /var/www/html/moodle/>" >> /etc/apache2/sites-available/000-default.conf
RUN echo "Options +FollowSymlinks" >> /etc/apache2/sites-available/000-default.conf
RUN echo "AllowOverride All" >> /etc/apache2/sites-available/000-default.conf
RUN echo "Require all granted" >> /etc/apache2/sites-available/000-default.conf
RUN echo "</Directory>" >> /etc/apache2/sites-available/000-default.conf

RUN echo "ErrorLog ${APACHE_LOG_DIR}/error.log" >> /etc/apache2/sites-available/000-default.conf
RUN echo "CustomLog ${APACHE_LOG_DIR}/access.log combined" >> /etc/apache2/sites-available/000-default.conf
RUN echo "</VirtualHost>" >> /etc/apache2/sites-available/000-default.conf


RUN a2enmod rewrite
RUN chmod 777 /var/www
RUN docker-php-ext-install mysqli && docker-php-ext-enable mysqli





