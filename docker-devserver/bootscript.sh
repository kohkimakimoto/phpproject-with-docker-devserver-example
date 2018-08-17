#!/usr/bin/env bash

# Setup mysqld password
MYSQL_ROOT_PASSWORD="Rootpassword@1980"
MYSQL_TMP_PASSWORD=`grep 'temporary password' /var/log/mysqld.log | sed -e "s/.*root@localhost: //"`
MYSQL_ROOT_PASSWORD_UPDATE_SQL="SET PASSWORD FOR root@localhost=PASSWORD('${MYSQL_ROOT_PASSWORD}');"
mysql -u root -p"${MYSQL_TMP_PASSWORD}" -e "${MYSQL_ROOT_PASSWORD_UPDATE_SQL}" --connect-expired-password
echo "GRANT ALL PRIVILEGES ON *.* TO 'root'@'%' IDENTIFIED BY '${MYSQL_ROOT_PASSWORD}';" |  mysql -uroot -p${MYSQL_ROOT_PASSWORD}
echo "FLUSH PRIVILEGES;" | mysql -uroot -p${MYSQL_ROOT_PASSWORD}


