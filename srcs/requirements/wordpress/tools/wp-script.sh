#!/bin/bash

sleep 4.20

if [ ! -f "var/www/html/wp-config.php" ]; then
	if cd /var/www/html && wp core download --allow-root; then

	wp config create --allow-root \
			--path=/var/www/html/ \
			--dbname=$MDB_NAME \
			--dbuser=$MDB_ADMIN_NAME \
			--dbpass=$MDB_ADMIN_PASS \
			--dbhost=$MDB_HOST \
			&& \
	wp core install --allow-root \
			--title=$WP_TITLE \
			--admin_user=$WP_ADMIN_USER \
			--admin_password=$WP_ADMIN_PASS \
			--admin_email=$WP_ADMIN_EMAIL \
			--url=$WP_URL \
			&& \
	wp user create --allow-root \
			$WP_USR_NAME --user_pass=$WP_USR_PASS $WP_USR_MAIL
	fi
fi

exec "$@"