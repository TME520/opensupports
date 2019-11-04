# opensupports
My Docker image for OpenSupports
## Manual extra steps
- Start MySQL manually

`/etc/init.d/mysql start`
- Install vim

`apt update && apt install -y vim`
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
