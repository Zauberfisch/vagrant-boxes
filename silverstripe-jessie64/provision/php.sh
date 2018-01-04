#!/bin/bash

mkdir -p /vagrant/logs/php
apt-get install -y mcrypt

# php 5
# ===================================
apt-get install -y php5.6 \
php5.6-gd \
php5.6-curl \
php5.6-mysqlnd \
php5.6-mcrypt \
php5.6-tidy \
php5.6-pgsql \
php5.6-zip \
php5.6-sqlite3 \
php5.6-xml \
php5.6-soap \
php5.6-intl \
php5.6-bz2 \
php5.6-bcmath \
php5.6-mbstring

sed -i 's@^[;\s]*date.timezone =.*$@date.timezone = "UTC"@' /etc/php/5.6/apache2/php.ini
sed -i 's@^[;\s]*date.timezone =.*$@date.timezone = "UTC"@' /etc/php/5.6/cli/php.ini
sed -i 's@^[;\s]*display_errors =.*$@display_errors = On@' /etc/php/5.6/apache2/php.ini
sed -i 's@^[;\s]*display_errors =.*$@display_errors = On@' /etc/php/5.6/cli/php.ini
sed -i "s@[;\s]*error_log =.*@error_log = \"/vagrant/logs/php/error.log\"@" /etc/php/5.6/apache2/php.ini
sed -i "s@[;\s]*error_log =.*@error_log = \"/vagrant/logs/php/error.log\"@" /etc/php/5.6/cli/php.ini
sed -i "s@[;\s]*mail.log =.*@mail.log = \"/vagrant/logs/php/mail.log\"@" /etc/php/5.6/apache2/php.ini
sed -i "s@[;\s]*mail.log =.*@mail.log = \"/vagrant/logs/php/mail.log\"@" /etc/php/5.6/cli/php.ini
sed -i "s@[;\s]*variables_order =.*@variables_order = \"EGPCS\"@" /etc/php/5.6/apache2/php.ini
sed -i "s@[;\s]*variables_order =.*@variables_order = \"EGPCS\"@" /etc/php/5.6/cli/php.ini

# xdebug
apt-get install -y php5.6-xdebug
cat <<EOF >> /etc/php/5.6/mods-available/xdebug.ini
xdebug.remote_enable = 1
xdebug.remote_connect_back = On
EOF

# php 7
# ===================================
apt-get install -y php7.0 \
php7.0-bcmath \
php7.0-bz2 \
php7.0-cli \
php7.0-common \
php7.0-curl \
php7.0-enchant \
php7.0-gd \
php7.0-gmp \
php7.0-imap \
php7.0-intl \
php7.0-json \
php7.0-ldap \
php7.0-mbstring \
php7.0-mcrypt \
php7.0-mysql \
php7.0-pgsql \
php7.0-phpdbg \
php7.0-pspell \
php7.0-readline \
php7.0-recode \
php7.0-snmp \
php7.0-soap \
php7.0-sqlite3 \
php7.0-tidy \
php7.0-xml \
php7.0-xmlrpc \
php7.0-xsl \
php7.0-zip

apt-get install -y php7.1 \
php7.1-bcmath \
php7.1-bz2 \
php7.1-cli \
php7.1-common \
php7.1-curl \
php7.1-enchant \
php7.1-gd \
php7.1-gmp \
php7.1-imap \
php7.1-intl \
php7.1-json \
php7.1-ldap \
php7.1-mbstring \
php7.1-mcrypt \
php7.1-mysql \
php7.1-pgsql \
php7.1-phpdbg \
php7.1-pspell \
php7.1-readline \
php7.1-recode \
php7.1-snmp \
php7.1-soap \
php7.1-sqlite3 \
php7.1-tidy \
php7.1-xml \
php7.1-xmlrpc \
php7.1-xsl \
php7.1-zip

apt-get install -y php7.2 \
php7.2-bcmath \
php7.2-bz2 \
php7.2-cli \
php7.2-common \
php7.2-curl \
php7.2-enchant \
php7.2-gd \
php7.2-gmp \
php7.2-imap \
php7.2-intl \
php7.2-json \
php7.2-ldap \
php7.2-mbstring \
php7.2-mysql \
php7.2-pgsql \
php7.2-phpdbg \
php7.2-pspell \
php7.2-readline \
php7.2-recode \
php7.2-snmp \
php7.2-soap \
php7.2-sodium \
php7.2-sqlite3 \
php7.2-tidy \
php7.2-xml \
php7.2-xmlrpc \
php7.2-xsl \
php7.2-zip

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

sed -i 's@^[;\s]*date.timezone =.*$@date.timezone = "UTC"@' /etc/php/7.1/apache2/php.ini
sed -i 's@^[;\s]*date.timezone =.*$@date.timezone = "UTC"@' /etc/php/7.1/cli/php.ini
sed -i 's@^[;\s]*display_errors =.*$@display_errors = On@' /etc/php/7.1/apache2/php.ini
sed -i 's@^[;\s]*display_errors =.*$@display_errors = On@' /etc/php/7.1/cli/php.ini
sed -i "s@[;\s]*error_log =.*@error_log = \"/vagrant/logs/php/error.log\"@" /etc/php/7.1/apache2/php.ini
sed -i "s@[;\s]*error_log =.*@error_log = \"/vagrant/logs/php/error.log\"@" /etc/php/7.1/cli/php.ini
sed -i "s@[;\s]*mail.log =.*@mail.log = \"/vagrant/logs/php/mail.log\"@" /etc/php/7.1/apache2/php.ini
sed -i "s@[;\s]*mail.log =.*@mail.log = \"/vagrant/logs/php/mail.log\"@" /etc/php/7.1/cli/php.ini
sed -i "s@[;\s]*variables_order =.*@variables_order = \"EGPCS\"@" /etc/php/7.1/apache2/php.ini
sed -i "s@[;\s]*variables_order =.*@variables_order = \"EGPCS\"@" /etc/php/7.1/cli/php.ini

sed -i 's@^[;\s]*date.timezone =.*$@date.timezone = "UTC"@' /etc/php/7.2/apache2/php.ini
sed -i 's@^[;\s]*date.timezone =.*$@date.timezone = "UTC"@' /etc/php/7.2/cli/php.ini
sed -i 's@^[;\s]*display_errors =.*$@display_errors = On@' /etc/php/7.2/apache2/php.ini
sed -i 's@^[;\s]*display_errors =.*$@display_errors = On@' /etc/php/7.2/cli/php.ini
sed -i "s@[;\s]*error_log =.*@error_log = \"/vagrant/logs/php/error.log\"@" /etc/php/7.2/apache2/php.ini
sed -i "s@[;\s]*error_log =.*@error_log = \"/vagrant/logs/php/error.log\"@" /etc/php/7.2/cli/php.ini
sed -i "s@[;\s]*mail.log =.*@mail.log = \"/vagrant/logs/php/mail.log\"@" /etc/php/7.2/apache2/php.ini
sed -i "s@[;\s]*mail.log =.*@mail.log = \"/vagrant/logs/php/mail.log\"@" /etc/php/7.2/cli/php.ini
sed -i "s@[;\s]*variables_order =.*@variables_order = \"EGPCS\"@" /etc/php/7.2/apache2/php.ini
sed -i "s@[;\s]*variables_order =.*@variables_order = \"EGPCS\"@" /etc/php/7.2/cli/php.ini

# xdebug
apt-get install -y php7.0-xdebug
cat <<EOF >> /etc/php/7.0/mods-available/xdebug.ini
xdebug.remote_enable = 1
xdebug.remote_connect_back = On
EOF

apt-get install -y php7.1-xdebug
cat <<EOF >> /etc/php/7.1/mods-available/xdebug.ini
xdebug.remote_enable = 1
xdebug.remote_connect_back = On
EOF

# xdebug for php 7.2 has not been released yet, so in the
# mean time let's use a self compiled beta build
# TODO remove the beta build once xdebug 2.6 has been released
#apt-get install -y php7.2-xdebug
#cat <<EOF >> /etc/php/7.2/mods-available/xdebug.ini
#xdebug.remote_enable = 1
#xdebug.remote_connect_back = On
#EOF
cp provision/php/xdebug-2.6.0beta2.so /etc/php/7.2
cat <<EOF > /etc/php/7.2/mods-available/xdebug-2.6.0beta2.ini
zend_extension=/etc/php/7.2/xdebug-2.6.0beta2.so
xdebug.remote_enable = 1
xdebug.remote_connect_back = On
EOF
ln -s /etc/php/7.2/mods-available/xdebug-2.6.0beta2.ini /etc/php/7.2/apache2/conf.d/20-xdebug.ini
ln -s /etc/php/7.2/mods-available/xdebug-2.6.0beta2.ini /etc/php/7.2/cli/conf.d/20-xdebug.ini

# composer
# ===================================
# use php5 to install composer and plugins, this might result in older versions,
# but should yield greater compatibility across all installed php versions
php-switch 5
mkdir -p /opt/composer
curl -sS https://getcomposer.org/installer | php
mv composer.phar /opt/composer/
ln -s /opt/composer/composer.phar /usr/local/bin/composer

sudo -u vagrant bash -c 'composer global config process-timeout 3000'
sudo -u vagrant bash -c 'composer global require "psy/psysh:@stable"'
sudo -u vagrant bash -c 'composer global require "fxp/composer-asset-plugin:@stable"'
sudo -u vagrant bash -c 'composer global require "silverstripe/sspak:dev-master"'

# make sure php7 is the default
php-switch 7

exit 0

