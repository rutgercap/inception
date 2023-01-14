#!/bin/bash

while ! mariadb -h$MYSQL_HOST -u$WP_DATABASE_USR -p$WP_DATABASE_PWD $WP_DATABASE_NAME &>/dev/null; do
    sleep 3
done

echo "Wordpress: updating permissions"
sed -i "s/listen = \/run\/php\/php7.3-fpm.sock/listen = 9000/" "/etc/php/7.3/fpm/pool.d/www.conf";
chown -R www-data:www-data /var/www/*;
chown -R 755 /var/www/*;
mkdir -p /run/php/;
touch /run/php/php7.3-fpm.pid;

echo "Wordpress: setting up..."
cd /var/www/html;
wp-cli core download --allow-root
mv /var/www/wp-config.php /var/www/html/
wp-cli core install --url="$DOMAIN_NAME/wordpress" --title="$WP_TITLE" --admin_user="$MYSQL_USER" --admin_password="$MYSQL_PASSWORD" --admin_email="$MYSQL_USER_EMAIL" --skip-email --allow-root
wp-cli user create $MYSQL_SECOND_USER $MYSQL_SECOND_USER_EMAIL --role=author --user_pass=$MYSQL_SECOND_PASSWORD --allow-root
echo "Wordpress: set up!"

exec "$@"