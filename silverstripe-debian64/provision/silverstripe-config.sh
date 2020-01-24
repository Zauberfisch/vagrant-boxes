#!/bin/bash

cp provision/silverstripe-config/_ss_environment.php /
cat provision/silverstripe-config/environment >> /etc/environment
echo ". /etc/environment" >> /etc/apache2/envvars

exit 0
