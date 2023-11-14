#!/bin/bash

sleep 4.20

if [ ! -f "var/www/html/wp-config.php" ]; then
	cd /var/www/html && wp core download --allow-root
fi

exec "$@"