# zauberfisch/silverstripe-jessie64

**Debian 8 x86_64 LAMP Box with many extra features, pre-configured for SilverStripe**

Default Website URL: http://127.0.0.1:8080/    
Default PhpMyAdmin URL: http://127.0.0.1:8080/phpmyadmin/    
Default MailHog URL: http://127.0.0.1:8025/    

## Installation

Currently virtualbox is the only supported provider. Support for libvirt might be added in the future.

    $ vagrant init zauberfisch/silverstripe-jessie64
    $ vagrant up --provider virtualbox
    
Configuration of ports or shared folders is not necessary as it is already pre-configured.

Alternatively, you can also find this box here:
  - [Vagrant / atlas.hashicorp.com](https://atlas.hashicorp.com/zauberfisch/boxes/silverstripe-jessie64)    
  - [Direct .box Download](http://boxes.vagrant.zauberfisch.at/silverstripe-jessie64/latest/) (not recommended)

## Usage

### Pre-Configuration

While this box can be used for anything, it is already pre-configured for SilverStripe.    
This means that a [`_ss_environment.php` file](provision/silverstripe-config/_ss_environment.php) (for SilverStripe 3) and System-wide [environment variables](provision/silverstripe-config/environment) (for SilverStripe 4)
are already set and contain database and other configuration for SilverStripe.    

The environment configuration also sets the default admin user to `admin` with the password `password`

Additionally, port forwarding and a shared folder are already configured making this box truly zero-configuration.     
In case of a port conflict, vagrant will automatically assign different ports, for example http://127.0.0.1:2200/ (Website) && http://127.0.0.1:2201/ (MailHog), 
this makes it possible to have multiple boxes running at the same time.
 
After booting, the following folders will be created:
- `www` the web-root (put your project in here)
- `logs/apache2` Will contain the apache access.log, error.log and other_vhosts_access.log files
- `logs/php` Will contain the php error.log and mail.log
- `logs/silverstripe` Will contain the SilverStripe error.log

Tis box is intended to be used for a single project, installing multiple SilverStripe sites is possible but will require additional configuration.

**Note: DO NOT use in production**, this box is intended for development and testing purpose only.

### Installing SilverStripe

All you need to do is put your project or a freshly downloaded SilverStripe into `www/` and run http://127.0.0.1:8080/dev/build?flush=1.     
No Installation required because the configuration is already in place.    
Just make sure you have a `_config.php` file that contains `require_once ('conf/ConfigureFromEnv.php');`.

If you still wish to run through the installer, that is still possible though.     
You can then simply tick the "use environment" checkbox to have the installer automatically pick up the database configuration.

### Features & Specs

- **Linux** Debian 8 Jessie (x86_64)
- **Apache2** Version 2.4
- **MySQL**-Server Version 5.5    
  Username: `root`    
  Password: `dont-use-in-prodction`    
  Default Database by SilverStripe configuration: `silverstripe`
  
  **Note: the database is located inside the virtual machine and will be lost if the virtual machine is deleted**
  
  `mysql-client` and `mysql-dump` scripts are available to easily access the database without a password.   
  - CLI Client: `$ vagrant ssh -c "mysql-client silverstripe"`
  - Import SQL File: `$ vagrant ssh -c "mysql-client silverstripe < /vagrant/dump.sql"`
  - Export SQL File: `$ vagrant ssh -c "mysql-dump silverstripe > /vagrant/dump.sql"`
  - Empty Database: `$ vagrant ssh -c "mysql-client -e 'drop database if exists silverstripe; create database silverstripe;'"`
      
  **Note: the scripts will not ask you to confirm before deleting your data**
  
- **PHP** CLI and mod_php Version 7.0 and 5.6    
  Run `$ vagrant ssh -c "php-switch <5|7>"` to switch the php version   
  For full phpinfo() see
  [php7-info-apache.html](http://boxes.vagrant.zauberfisch.at/silverstripe-jessie64/latest/php7-info-apache.html),
  [php7-info-cli.txt](http://boxes.vagrant.zauberfisch.at/silverstripe-jessie64/latest/php7-info-cli.txt),
  [php5-info-apache.html](http://boxes.vagrant.zauberfisch.at/silverstripe-jessie64/latest/php5-info-apache.html) and
  [php5-info-cli.txt](http://boxes.vagrant.zauberfisch.at/silverstripe-jessie64/latest/php5-info-cli.txt)
- **_ss_environment.php & /etc/environment**    

      SS_DATABASE_SERVER = "localhost"
      SS_DATABASE_USERNAME = "root"
      SS_DATABASE_PASSWORD = "dont-use-in-production"
      SS_DATABASE_NAME = "silverstripe"
      
      SS_ENVIRONMENT_TYPE = "dev"
      
      # log to /vagrant/logs/silverstripe/error.log
      SS_ERROR_LOG = "/../logs/silverstripe/error.log"
      
      SS_DEFAULT_ADMIN_USERNAME = "admin"
      SS_DEFAULT_ADMIN_PASSWORD = "password"
      
      SS_SASSC_PATH = "/usr/local/bin/sassc"
      SS_LESSC_PATH = "/usr/local/bin/lessc"
      SS_WKHTMLTOPDF_PATH = "/usr/bin/wkhtmltopdf"
      SS_WKHTMLTOIMAGE_PATH = "/usr/bin/wkhtmltoimage"
      
      SS_BASE_URL="http://127.0.0.1"
- **PhpMyAdmin** Version 4.7    
  Pre-configured for password-less access (Default URL: http://127.0.0.1:8080/phpmyadmin/)
- **MailHog** Version 1.0    
  A mailcatcher alternative that replaces sendmail (and offers a smtp server on localhost:1025) to catch all outgoing 
  emails and display them in a web interface (Default URL: http://127.0.0.1:8025/)
- **sassc** Version 3.4 (libsass 3.5, sass2scss 1.1, sass 3.5)
- **lessc** Version 2.7
- **nodejs & npm** Version 0.10 & 1.4
  - **bower** Version 1.8
  - **grunt** Version 1.2
  - **gulp** Version 3.9
- **composer** Version 1.4
  - **composer-asset-plugin** Version 1.3    
    npm & bower package management via composer
- **psysh** Version 0.8
- **sake** Version 4.0-alpha7
- **wkhtmltopdf & wkhtmltoimage** Version 0.12 (Without patched QT)


## License

The following license applies to all files and scripts use to provision the operating system, the operating system
itself as well as installed third-party software is subject to their respective licenses.

    Copyright (c) 2017 Zauberfisch
    
    Permission is hereby granted, free of charge, to any person obtaining a copy
    of this software and associated documentation files (the "Software"), to deal
    in the Software without restriction, including without limitation the rights
    to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
    copies of the Software, and to permit persons to whom the Software is
    furnished to do so, subject to the following conditions:
    
    The above copyright notice and this permission notice shall be included in all
    copies or substantial portions of the Software.
    
    THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
    IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
    FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
    AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
    LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
    OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE
    SOFTWARE.
