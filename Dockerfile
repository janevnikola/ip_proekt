FROM php:7.4-apache
COPY /home/docker/php/ /var/www/html/

RUN echo "ServerName 127.0.0.1" >> /etc/apache2/apache2.conf
RUN service apache2 restart
RUN apt update -y
RUN apt upgrade -y
RUN apt install nano -y
RUN apt install git -y
RUN git clone https://github.com/moodle/moodle.git 
