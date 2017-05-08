#!/bin/bash

git clone https://github.com/sass/libsass.git /opt/libsass
git clone https://github.com/sass/sassc.git /opt/sassc
export SASS_LIBSASS_PATH=/opt/libsass
make -C /opt/sassc
ln -s /opt/sassc/bin/sassc /usr/local/bin/sassc

exit 0
