FROM debian:9.3
MAINTAINER TME520 version: 0.3

# Setting environment variables
ENV APACHE_RUN_USER www-data
ENV APACHE_RUN_GROUP www-data
ENV APACHE_LOG_DIR /var/log/apache2
ENV APACHE_RUN_DIR /etc/apache2/
ENV APACHE_PID_FILE /etc/apache2/pid

# Install required packages
RUN apt update && \
    apt upgrade -y && \
    apt install -y apache2 mysql-server php php-mysql unzip syslog-ng supervisor git && \
    apt-get clean && \
    rm -rf /var/lib/apt/lists/*

# Activate PDO for PHP
RUN phpenmod pdo_mysql

COPY supervisord.conf /etc/supervisor/supervisord.conf
COPY entrypoint.sh /

# Copy files from local fs to Docker image
COPY opensupports_v4.5.0.zip /tmp/
COPY index.html /var/www/html/
COPY info.php /var/www/html/
COPY apache2.conf /etc/apache2/

RUN mkdir -p /var/www/html/opensupport/ && \
    unzip -o /tmp/opensupports_v4.5.0.zip -d /var/www/html/opensupport/ && \
    chown -R www-data:www-data /var/www/ && \
    a2enmod rewrite

EXPOSE 80

# Run Supervisor
ENTRYPOINT [ "/bin/bash", "entrypoint.sh" ]
# CMD ["/usr/sbin/apache2", "-D", "FOREGROUND"]
