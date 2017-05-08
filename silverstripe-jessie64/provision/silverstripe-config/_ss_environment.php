<?php

define('SS_DATABASE_SERVER', 'localhost');
define('SS_DATABASE_USERNAME', 'root');
define('SS_DATABASE_PASSWORD', 'dont-use-in-production');
define('SS_DATABASE_NAME', 'silverstripe');

define('SS_ENVIRONMENT_TYPE', 'dev');

# log to /vagrant/logs/silverstripe/error.log
define('SS_ERROR_LOG', '/../logs/silverstripe/error.log');

define('SS_DEFAULT_ADMIN_USERNAME', 'admin');
define('SS_DEFAULT_ADMIN_PASSWORD', 'password');

define('SS_SASSC_PATH', '/usr/local/bin/sassc');
define('SS_LESSC_PATH', '/usr/local/bin/lessc');
define('SS_WKHTMLTOPDF_PATH', '/usr/bin/wkhtmltopdf');
define('SS_WKHTMLTOIMAGE_PATH', '/usr/bin/wkhtmltoimage');


global $_FILE_TO_URL_MAPPING;
$_FILE_TO_URL_MAPPING['/vagrant/www/'] = 'http://127.0.0.1';
$_FILE_TO_URL_MAPPING['/vagrant/www'] = 'http://127.0.0.1';
