#!/bin/bash

# Found on GitHub by CentOS/CentOS-Dockerfiles

# Make sure we're not confused by old, incompletely-shutdown httpd
# context after restarting the container.  httpd won't start correctly
# if it thinks it is already running.
rm -rf /run/httpd/* /tmp/httpd*

/opt/rh/rh-php73/root/usr/sbin/php-fpm &
exec /usr/sbin/apachectl -DFOREGROUND
