#!/bin/bash

apt-get install -q -y postgresql

systemctl restart postgresql.service


cat >> /etc/postgresql/9.4/main/pg_hba.conf << EOF
host all all 0.0.0.0/0 md5
host all all ::/0 md5
EOF

cat >> /etc/postgresql/9.4/main/postgresql.conf << EOF
listen_addresses = '*'
EOF

sudo -u postgres psql postgres -c "alter user postgres with password 'dont-use-in-production';"

exit 0
