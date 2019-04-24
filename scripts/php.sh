# Install PHP 7.3

# Install remi repo
yum -y install http://rpms.remirepo.net/enterprise/remi-release-7.rpm

# Enable remi repo for php73
yum-config-manager --enable remi-php73

yum -y install php

