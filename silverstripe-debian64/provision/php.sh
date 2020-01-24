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
php7.2-sqlite3 \
php7.2-tidy \
php7.2-xml \
php7.2-xmlrpc \
php7.2-xsl \
php7.2-zip
#php7.2-sodium \

apt-get install -y php7.3 \
php7.3-bcmath \
php7.3-bz2 \
php7.3-cli \
php7.3-common \
php7.3-curl \
php7.3-enchant \
php7.3-gd \
php7.3-gmp \
php7.3-imap \
php7.3-intl \
php7.3-json \
php7.3-ldap \
php7.3-mbstring \
php7.3-mysql \
php7.3-pgsql \
php7.3-phpdbg \
php7.3-pspell \
php7.3-readline \
php7.3-recode \
php7.3-snmp \
php7.3-soap \
php7.3-sqlite3 \
php7.3-tidy \
php7.3-xml \
php7.3-xmlrpc \
php7.3-xsl \
php7.3-zip
#php7.3-sodium \

apt-get install -y php7.4 \
php7.4-bcmath \
php7.4-bz2 \
php7.4-cli \
php7.4-common \
php7.4-curl \
php7.4-enchant \
php7.4-gd \
php7.4-gmp \
php7.4-imap \
php7.4-intl \
php7.4-json \
php7.4-ldap \
php7.4-mbstring \
php7.4-mysql \
php7.4-pgsql \
php7.4-phpdbg \
php7.4-pspell \
php7.4-readline \
php7.4-snmp \
php7.4-soap \
php7.4-sqlite3 \
php7.4-tidy \
php7.4-xml \
php7.4-xmlrpc \
php7.4-xsl \
php7.4-zip
#php7.4-sodium \
#php7.4-recode \

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

sed -i 's@^[;\s]*date.timezone =.*$@date.timezone = "UTC"@' /etc/php/7.3/apache2/php.ini
sed -i 's@^[;\s]*date.timezone =.*$@date.timezone = "UTC"@' /etc/php/7.3/cli/php.ini
sed -i 's@^[;\s]*display_errors =.*$@display_errors = On@' /etc/php/7.3/apache2/php.ini
sed -i 's@^[;\s]*display_errors =.*$@display_errors = On@' /etc/php/7.3/cli/php.ini
sed -i "s@[;\s]*error_log =.*@error_log = \"/vagrant/logs/php/error.log\"@" /etc/php/7.3/apache2/php.ini
sed -i "s@[;\s]*error_log =.*@error_log = \"/vagrant/logs/php/error.log\"@" /etc/php/7.3/cli/php.ini
sed -i "s@[;\s]*mail.log =.*@mail.log = \"/vagrant/logs/php/mail.log\"@" /etc/php/7.3/apache2/php.ini
sed -i "s@[;\s]*mail.log =.*@mail.log = \"/vagrant/logs/php/mail.log\"@" /etc/php/7.3/cli/php.ini
sed -i "s@[;\s]*variables_order =.*@variables_order = \"EGPCS\"@" /etc/php/7.3/apache2/php.ini
sed -i "s@[;\s]*variables_order =.*@variables_order = \"EGPCS\"@" /etc/php/7.3/cli/php.ini

sed -i 's@^[;\s]*date.timezone =.*$@date.timezone = "UTC"@' /etc/php/7.4/apache2/php.ini
sed -i 's@^[;\s]*date.timezone =.*$@date.timezone = "UTC"@' /etc/php/7.4/cli/php.ini
sed -i 's@^[;\s]*display_errors =.*$@display_errors = On@' /etc/php/7.4/apache2/php.ini
sed -i 's@^[;\s]*display_errors =.*$@display_errors = On@' /etc/php/7.4/cli/php.ini
sed -i "s@[;\s]*error_log =.*@error_log = \"/vagrant/logs/php/error.log\"@" /etc/php/7.4/apache2/php.ini
sed -i "s@[;\s]*error_log =.*@error_log = \"/vagrant/logs/php/error.log\"@" /etc/php/7.4/cli/php.ini
sed -i "s@[;\s]*mail.log =.*@mail.log = \"/vagrant/logs/php/mail.log\"@" /etc/php/7.4/apache2/php.ini
sed -i "s@[;\s]*mail.log =.*@mail.log = \"/vagrant/logs/php/mail.log\"@" /etc/php/7.4/cli/php.ini
sed -i "s@[;\s]*variables_order =.*@variables_order = \"EGPCS\"@" /etc/php/7.4/apache2/php.ini
sed -i "s@[;\s]*variables_order =.*@variables_order = \"EGPCS\"@" /etc/php/7.4/cli/php.ini

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

apt-get install -y php7.2-xdebug
cat <<EOF >> /etc/php/7.2/mods-available/xdebug.ini
xdebug.remote_enable = 1
xdebug.remote_connect_back = On
EOF

apt-get install -y php7.3-xdebug
cat <<EOF >> /etc/php/7.3/mods-available/xdebug.ini
xdebug.remote_enable = 1
xdebug.remote_connect_back = On
EOF

apt-get install -y php7.4-xdebug
cat <<EOF >> /etc/php/7.4/mods-available/xdebug.ini
xdebug.remote_enable = 1
xdebug.remote_connect_back = On
EOF


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
php-switch 7.3

exit 0

