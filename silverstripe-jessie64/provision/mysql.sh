#!/bin/bash

debconf-set-selections <<< "mysql-server-5.5 mysql-server/root_password password dont-use-in-production"
debconf-set-selections <<< "mysql-server-5.5 mysql-server/root_password_again password dont-use-in-production"
apt-get install -q -y mysql-server-5.5
apt-get install -y mysql-client libmysqlclient-dev libmysqld-dev
apt-get install -y libsqlite3-dev

cat >> /etc/mysql/conf.d/innodb-extra.cnf << EOF
[mysqld]
innodb_large_prefix=1
innodb_file_format=BARRACUDA
innodb_file_per_table=1
EOF

exit 0
