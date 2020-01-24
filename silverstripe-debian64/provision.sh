#!/bin/bash

cd /vagrant/

# general
# ===================================
apt-get update -y
apt-get install -y curl build-essential software-properties-common tmux screen apt-transport-https
apt-get install -y git wget vim tree htop screen zip unzip jq curl

apt-get install -y nodejs npm
ln -s $(which nodejs) /usr/local/bin/node
npm install -g bower
npm install -g bower-installer
npm install -g grunt-cli
npm install -g gulp
npm install -g less


# php repos
# ===================================
curl -sS https://packages.sury.org/php/apt.gpg | apt-key add -
cat >> /etc/apt/sources.list << EOF
deb https://packages.sury.org/php/ buster main
EOF

apt-get update -y

# database
# ===================================
./provision/mysql.sh
./provision/postgresql.sh

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
# current repository version of wkhtmltopdf can not run headless
# for now, let's use a custom build with patched qt
# still install the package though, to install all dependencies
apt-get install -y wkhtmltopdf
cp provision/wkhtmltopdf/wkhtmltopdf /usr/local/bin
cp provision/wkhtmltopdf/wkhtmltoimage /usr/local/bin
update-alternatives --set wkhtmltopdf "/usr/local/bin/wkhtmltopdf"
update-alternatives --set wkhtmltoimage "/usr/local/bin/wkhtmltoimage"

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

