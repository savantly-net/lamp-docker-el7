#!/bin/bash
set -e

cd /var/www/html

if [ -z "$SERVER_NAME" ]; then
	echo "ServerName localhost" >> /etc/apache2/apache2.conf
else
	echo "ServerName $SERVER_NAME" >> /etc/apache2/apache2.conf
fi

echo "Checking apache config syntax: "
apache2ctl -t
echo "Apache Included Configs:"
apache2ctl -t -D DUMP_INCLUDES
echo "Apache VHOSTS:"
apache2ctl -t -D DUMP_VHOSTS
echo "Apache run configuration:"
apache2ctl -t -D DUMP_RUN_CFG
echo "Apache Loaded Modules:"
apache2ctl -t -D DUMP_MODULES

apache2ctl -E /dev/stderr -k start

exec "$@"