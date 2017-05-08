#!/bin/bash

mkdir -p /vagrant/logs/php
apt-get install -y mcrypt

# php 5
# ===================================
apt-get install -y php5 php5-json php5-gd php5-curl php5-mysqlnd php5-mcrypt php5-tidy

sed -i 's@^[;\s]*date.timezone =.*$@date.timezone = "UTC"@' /etc/php5/apache2/php.ini
sed -i 's@^[;\s]*date.timezone =.*$@date.timezone = "UTC"@' /etc/php5/cli/php.ini
sed -i 's@^[;\s]*display_errors =.*$@display_errors = On@' /etc/php5/apache2/php.ini
sed -i 's@^[;\s]*display_errors =.*$@display_errors = On@' /etc/php5/cli/php.ini
sed -i "s@[;\s]*error_log =.*@error_log = \"/vagrant/logs/php/error.log\"@" /etc/php5/apache2/php.ini
sed -i "s@[;\s]*error_log =.*@error_log = \"/vagrant/logs/php/error.log\"@" /etc/php5/cli/php.ini
sed -i "s@[;\s]*mail.log =.*@mail.log = \"/vagrant/logs/php/mail.log\"@" /etc/php5/apache2/php.ini
sed -i "s@[;\s]*mail.log =.*@mail.log = \"/vagrant/logs/php/mail.log\"@" /etc/php5/cli/php.ini
sed -i "s@[;\s]*variables_order =.*@variables_order = \"EGPCS\"@" /etc/php5/apache2/php.ini
sed -i "s@[;\s]*variables_order =.*@variables_order = \"EGPCS\"@" /etc/php5/cli/php.ini

# xdebug
apt-get install -y php5-xdebug
cat <<EOF >> /etc/php5/apache2/conf.d/20-xdebug.ini
xdebug.remote_enable = 1
xdebug.remote_connect_back = On
xdebug.idekey = PHPSTORM
EOF

# php 7
# ===================================
apt-get install -y php7.0 php7.0-bcmath php7.0-bz2 php7.0-cli php7.0-common php7.0-curl php7.0-dba php7.0-gd php7.0-gmp php7.0-imagick php7.0-imap php7.0-intl php7.0-json php7.0-ldap php7.0-mbstring php7.0-mcrypt php7.0-mysql php7.0-odbc php7.0-opcache php7.0-pgsql php7.0-readline php7.0-redis php7.0-soap php7.0-sqlite3 php7.0-ssh2 php7.0-tidy php7.0-xml php7.0-xmlrpc php7.0-xsl php7.0-zip

sed -i 's@^[;\s]*date.timezone =.*$@date.timezone = "UTC"@' /etc/php/7.0/apache2/php.ini
sed -i 's@^[;\s]*date.timezone =.*$@date.timezone = "UTC"@' /etc/php/7.0/cli/php.ini
sed -i 's@^[;\s]*display_errors =.*$@display_errors = On@' /etc/php/7.0/apache2/php.ini
sed -i 's@^[;\s]*display_errors =.*$@display_errors = On@' /etc/php/7.0/cli/php.ini
sed -i "s@[;\s]*error_log =.*@error_log = \"/vagrant/logs/php/error.log\"@" /etc/php/7.0/apache2/php.ini
sed -i "s@[;\s]*error_log =.*@error_log = \"/vagrant/logs/php/error.log\"@" /etc/php/7.0/cli/php.ini
sed -i "s@[;\s]*mail.log =.*@mail.log = \"/vagrant/logs/php/mail.log\"@" /etc/php/7.0/apache2/php.ini
sed -i "s@[;\s]*mail.log =.*@mail.log = \"/vagrant/logs/php/mail.log\"@" /etc/php/7.0/cli/php.ini
sed -i "s@[;\s]*variables_order =.*@variables_order = \"EGPCS\"@" /etc/php/7.0/apache2/php.ini
sed -i "s@[;\s]*variables_order =.*@variables_order = \"EGPCS\"@" /etc/php/7.0/cli/php.ini

# xdebug
apt-get install -y php7.0-xdebug
cat <<EOF >> /etc/php/7.0/apache2/conf.d/20-xdebug.ini
xdebug.remote_enable = 1
xdebug.remote_connect_back = On
xdebug.idekey = PHPSTORM
EOF

# make sure php7 is the default
php-switch 7

# composer
# ===================================
mkdir -p /opt/composer
curl -sS https://getcomposer.org/installer | php
mv composer.phar /opt/composer/
ln -s /opt/composer/composer.phar /usr/local/bin/composer

sudo -u vagrant bash -c 'composer global config process-timeout 3000'
sudo -u vagrant bash -c 'composer global require "psy/psysh:@stable"'
sudo -u vagrant bash -c 'composer global require "fxp/composer-asset-plugin:~1.0"'

exit 0

