# opensupports
My Docker image for OpenSupports
## Manual extra steps
- In /etc/apache2/apache2.conf, set AllowOverride to All for /var/www/
- Manually create a new MySQL user:
```
mysql
USE mysql
CREATE USER 'opensupports'@'localhost' IDENTIFIED BY 'opensupports';
GRANT ALL PRIVILEGES ON *.* TO 'opensupports'@'localhost';
FLUSH PRIVILEGES;
exit
```
## Access URL
http://localhost/opensupport/admin
