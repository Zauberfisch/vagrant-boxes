#!/bin/bash

composer config --global discard-changes true
composer create-project phpmyadmin/phpmyadmin /opt/phpmyadmin --repository-url=https://www.phpmyadmin.net/packages.json --no-dev --prefer-dist --no-interaction
composer config --global discard-changes false
rm -rf /opt/phpmyadmin/setup
/usr/local/bin/mysql-client -e 'drop database if exists phpmyadmin; create database phpmyadmin;'
/usr/local/bin/mysql-client phpmyadmin < /opt/phpmyadmin/sql/create_tables.sql

cp provision/phpmyadmin/config.inc.php /opt/phpmyadmin/
cp provision/phpmyadmin/phpmyadmin.conf /etc/apache2/sites-available/
a2ensite phpmyadmin.conf

exit 0
