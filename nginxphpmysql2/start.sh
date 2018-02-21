#!/usr/bin/env bash

service nginx start &
service php7.0-fpm start &
service mysql start &

sleep 2
cp /src/prueba.php /var/www/html/prueba.php
cp /src/ejemplo2.php /var/www/html/ejemplo2.php

mysql -pP1ngP4ng -u root < /src/prueba.sql

echo " GRANT ALL PRIVILEGES ON *.* TO 'root'@'%' IDENTIFIED BY 'P1ngP4ng' WITH GRANT OPTION; FLUSH PRIVILEGES" | mysql -pP1ngP4ng -u root 

/bin/bash
