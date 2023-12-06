#!/bin/bash

if [ ! -d "/var/lib/mysql/$MDB_NAME" ]; then 

service mariadb start

sleep 4.20

echo "Service started, creating admin user..."

mysql -u root -e "CREATE DATABASE $MDB_NAME;"

#User@% allows access from all locations
mysql -u root -e "CREATE USER '$MDB_ADMIN_NAME'@'%' IDENTIFIED BY '$MDB_ADMIN_PASS';"

mysql -u root -e "GRANT ALL PRIVILEGES ON *.* TO '$MDB_ADMIN_NAME'@'%';"

#save the changes
mysql -u root -e "FLUSH PRIVILEGES;"

echo "Setting root password..."

mysqladmin -u root password "$MDB_ROOT_PASS"

mysqladmin -u root -p"$MDB_ROOT_PASS" shutdown
fi

#sql waits on any port
exec mysqld_safe --bind-address=0.0.0.0