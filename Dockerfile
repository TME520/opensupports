FROM debian:9
MAINTAINER TME520 version: 0.1

# Setting environment variables
ENV APACHE_RUN_USER www-data
ENV APACHE_RUN_GROUP www-data
ENV APACHE_LOG_DIR /var/log/apache2

# Install required packages
# RUN apt-get update && \
#     apt-get install -y apache2 mysql-server mariadb-server php php-mysql && \
#     apt-get clean && \
#     rm -rf /var/lib/apt/lists/*

RUN apt update
RUN apt install -y apache2 mysql-server mariadb-server php php-mysql

# Activate PDO for PHP
RUN phpenmod pdo_mysql

EXPOSE 80

CMD ["/usr/sbin/apache2", "-D", "FOREGROUND"]
