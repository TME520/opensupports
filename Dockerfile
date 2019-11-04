FROM debian:9
MAINTAINER TME520 version: 0.1

# Setting environment variables
ENV APACHE_RUN_USER www-data
ENV APACHE_RUN_GROUP www-data
ENV APACHE_LOG_DIR /var/log/apache2

# Copy files from local fs to Docker image
COPY ./opensupports_v4.5.0.zip /tmp/
COPY index.html /var/www/html/

# Install required packages
RUN apt-get update && \
    apt-get install -y apache2 mysql-server mariadb-server php php-mysql unzip && \
    apt-get clean && \
    rm -rf /var/lib/apt/lists/*

# Activate PDO for PHP
RUN phpenmod pdo_mysql

RUN unzip /tmp/opensupports_v4.5.0.zip

EXPOSE 80

CMD ["/usr/sbin/apache2", "-D", "FOREGROUND"]
