#!/bin/sh

[ -f /run-pre.sh ] && /run-pre.sh

if [ ! -d /var/www/html ] ; then
  echo "[i] Creating directories..."
  mkdir -p /var/www/html
fi
echo "[i] Fixing permissions..."
chown -R nginx:nginx /var/www/*
echo $?

# Configure wordpress stuff
wp-cli core download --allow-root
wp-cli config create --dbname="$MYSQL_DATABASE" --dbuser="$MYSQL_USER" --dbpass="$MYSQL_PASSWORD" --dbhost="$MYSQL_HOST" --dbcollate="utf8_general_ci" --allow-root
wp-cli core install --url="$DOMAIN_NAME/wordpress" --title="$WP_TITLE" --admin_user="$MYSQL_USER" --admin_password="$MYSQL_PASSWORD" --admin_email="$MYSQL_USER_EMAIL" --skip-email --allow-root
wp-cli user create $MYSQL_SECOND_USER $MYSQL_SECOND_USER_EMAIL --role=author --user_pass=$MYSQL_SECOND_PASSWORD --allow-root

# start php-fpm
echo starting php
mkdir -p /usr/logs/php-fpm
/usr/sbin/php-fpm81 -F -R
