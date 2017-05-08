#!/bin/bash

apt-get install -y apache2

mkdir -p /vagrant/www
mkdir -p /vagrant/logs/apache2

a2enmod rewrite
a2enmod headers

cp provision/apache/000-default.conf /etc/apache2/sites-available/000-default.conf
# set logs path
sed -i 's@export APACHE_LOG_DIR=.*$@export APACHE_LOG_DIR=/vagrant/logs/apache2@' /etc/apache2/envvars
systemctl restart apache2.service

rm -rf /var/log/apache2
rm -rf /var/www
