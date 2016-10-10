FROM php:5.6.26-apache
MAINTAINER Ahmed Maawy

# Install cron jobs
RUN apt-get update
RUN apt-get install cron -y

# Copy cron job
COPY crontab.txt /var/crontab.txt
RUN crontab /var/crontab.txt
RUN chmod 600 /etc/crontab

# Copy custom run script
COPY run.sh /run.sh
RUN chmod 755 /run.sh

# Install PHP PDO
RUN docker-php-ext-install mysql mysqli pdo pdo_mysql

CMD ["/run.sh"]
