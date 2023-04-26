#!/bin/sh

# Load BlackFire
if [ "${ENABLE_BLACKFIRE}" != "1" ]; then
	rm -f /usr/local/etc/php/conf.d/blackfire.ini
fi

# Load xDebug
if [ "${ENABLE_XDEBUG}" != "1" ]; then
	rm -f /usr/local/etc/php/conf.d/docker-php-ext-xdebug.ini
fi

# Load Redis
if [ "${ENABLE_REDIS}" != "1" ]; then
	rm -f /usr/local/etc/php/conf.d/docker-php-ext-redis.ini
fi

# service php-fpm restart
exec /usr/local/bin/docker-entrypoint.sh "$@"