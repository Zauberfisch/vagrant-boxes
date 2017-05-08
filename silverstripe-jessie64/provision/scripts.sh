#!/bin/bash

mkdir /opt/scripts/

curl -sS https://raw.githubusercontent.com/silverstripe/silverstripe-framework/master/sake > /opt/scripts/sake-original
cp provision/scripts/* /opt/scripts/
chmod +x /opt/scripts/*
ln -s /opt/scripts/* /usr/local/bin/

exit 0
