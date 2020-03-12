#!/bin/bash

sleep 10

## Perform variable substitution in /var/www/config/ampache.cfg.php
echo "Setting variables in /var/www/config/ampache.cfg.php"

# Do *not* invert the order of sedding LOCAL_WEB_PATH and WEB_PATH
sed "s/LOCAL_WEB_PATH/$LOCAL_WEB_PATH/" -i /var/www/config/ampache.cfg.php
sed "s/WEB_PATH/$WEB_PATH/" -i /var/www/config/ampache.cfg.php
sed "s/DATABASE_HOSTNAME/$DATABASE_HOSTNAME/" -i /var/www/config/ampache.cfg.php
sed "s/DATABASE_PORT/$DATABASE_PORT/" -i /var/www/config/ampache.cfg.php
sed "s/DATABASE_NAME/$DATABASE_NAME/" -i /var/www/config/ampache.cfg.php
sed "s/DATABASE_USERNAME/$DATABASE_USERNAME/" -i /var/www/config/ampache.cfg.php
sed "s/DATABASE_PASSWORD/$DATABASE_PASSWORD/" -i /var/www/config/ampache.cfg.php
sed "s/SECRET_KEY/$SECRET_KEY/" -i /var/www/config/ampache.cfg.php


echo "Generated config (comments ignored):"
grep -v "^;" /var/www/config/ampache.cfg.php | \
    sed 's/[[:blank:]]//' | grep -v "^$"

# Start apache in the background
service apache2 start

# Start cron in the background
cron 

# Start a process to watch for changes in the library with inotify
while true; do
    inotifywatch /media
    php /var/www/bin/catalog_update.inc -a
    sleep 30
done