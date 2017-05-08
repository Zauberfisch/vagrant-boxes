#!/bin/bash

cd /vagrant/

# general
# ===================================
apt-get update -y
apt-get install -y curl build-essential python-software-properties tmux screen
apt-get install -y git wget vim tree htop screen zip unzip jq
apt-get install -y nodejs npm
ln -s $(which nodejs) /usr/local/bin/node
npm install -g bower
npm install -g bower-installer
npm install -g grunt-cli
npm install -g gulp
npm install -g less

# dotdeb php builds
# ===================================
curl -sS https://www.dotdeb.org/dotdeb.gpg | apt-key add -
cat >> /etc/apt/sources.list << EOF
deb http://packages.dotdeb.org jessie all
deb-src http://packages.dotdeb.org jessie all
EOF
apt-get update -y

# database
# ===================================
./provision/mysql.sh

# helper scripts
# ===================================
./provision/scripts.sh

# apache2
# ===================================
./provision/apache.sh

# php
# ===================================
./provision/php.sh

# silverstripe config
# ===================================
./provision/silverstripe-config.sh

# phpmyadmin
# ===================================
./provision/phpmyadmin.sh

# sass
# ===================================
./provision/sass.sh

# wkhtmltopdf
# ===================================
apt-get install -y wkhtmltopdf

# mail
# ===================================
./provision/mail.sh

# make ssh login automatically cd to /vagrant
echo "
if [ -d \"/vagrant\" ]; then
	cd /vagrant/
fi

$(cat /home/vagrant/.bashrc)

alias l='ls -aFG'
alias ll='ls -alFGh'
alias vi='vim'
export EDITOR=vim
export PATH=\"\$PATH:\$HOME/.composer/vendor/bin\"
" > /home/vagrant/.bashrc

