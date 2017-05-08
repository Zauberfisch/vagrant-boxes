#!/bin/bash

debconf-set-selections <<< "mysql-server-5.5 mysql-server/root_password password dont-use-in-production"
debconf-set-selections <<< "mysql-server-5.5 mysql-server/root_password_again password dont-use-in-production"
apt-get install -q -y mysql-server-5.5
apt-get install -y mysql-client libmysqlclient-dev libmysqld-dev
apt-get install -y libsqlite3-dev

exit 0
