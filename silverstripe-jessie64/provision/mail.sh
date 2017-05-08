#!/bin/bash

mkdir -p /opt/MailHog
curl $(curl -s https://api.github.com/repos/mailhog/MailHog/releases/latest | jq --raw-output '.assets[] | select(.name | contains("linux")) | select(.name | contains("amd64")) | .browser_download_url') -o /opt/MailHog/MailHog -L
# curl $(curl -s https://api.github.com/repos/mailhog/mhsendmail/releases/latest | jq --raw-output '.assets[] | select(.name | contains("linux")) | select(.name | contains("amd64")) | .browser_download_url') -o /opt/MailHog/mhsendmail -L
cp provision/mail/sendmail.sh /opt/MailHog/
chmod +x /opt/MailHog/MailHog
chmod +x /opt/MailHog/sendmail.sh

rm /usr/sbin/sendmail
ln -s /opt/MailHog/sendmail.sh /usr/sbin/sendmail

cp provision/mail/mailhog.service /etc/systemd/system/
systemctl daemon-reload
systemctl enable mailhog.service
systemctl start mailhog.service

exit 0
