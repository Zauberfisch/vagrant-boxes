#!/bin/bash

apt-get install -q -y mariadb-server
#apt-get install -y mariadb-common mariadb-client libmariadb-dev libmariadbd-dev

cat >> /etc/mysql/conf.d/innodb-extra.cnf << EOF
[mysqld]
innodb_large_prefix=1
innodb_file_format=BARRACUDA
innodb_file_per_table=1
EOF

mysql -u root mysql -e "UPDATE user SET Host='%',plugin='mysql_native_password',Password=PASSWORD('dont-use-in-production') WHERE user='root'; FLUSH PRIVILEGES;"

exit 0
