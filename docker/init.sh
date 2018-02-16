#!/bin/bash

/usr/bin/memcached --daemon -u memcached -p 11211 -m 128 -c 1024 -l 127.0.0.1
sleep 1
su -l nginx -s /bin/bash -c "/usr/sbin/php-fpm"
sleep 5
/usr/sbin/nginx
