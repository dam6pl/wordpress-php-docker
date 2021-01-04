FROM wordpress:php7.4-fpm

# Update image packages
RUN apt-get update \
    && apt-get install --no-install-recommends --assume-yes --quiet ca-certificates curl git \
    && rm -rf /var/lib/apt/lists/

# Install the xDebug PHP excension
RUN pecl install xdebug \
    && docker-php-ext-enable xdebug \
    && docker-php-source delete \
    && echo "zend_extension=$(find /usr/local/lib/php/extensions/ -name xdebug.so)" > "$PHP_INI_DIR/conf.d/docker-php-ext-xdebug.ini" \
    && echo "xdebug.mode=debug" >> "$PHP_INI_DIR/conf.d/docker-php-ext-xdebug.ini" \
    && echo "xdebug.start_with_request=yes" >> "$PHP_INI_DIR/conf.d/docker-php-ext-xdebug.ini" \
    && echo "xdebug.client_host=host.docker.internal" >> "$PHP_INI_DIR/conf.d/docker-php-ext-xdebug.ini" \
    && echo "xdebug.client_port=9000" >> "$PHP_INI_DIR/conf.d/docker-php-ext-xdebug.ini" \
    && echo "xdebug.remote_handler=dbgp" >> "$PHP_INI_DIR/conf.d/docker-php-ext-xdebug.ini" \
    && echo "xdebug.discover_client_host=0" >> "$PHP_INI_DIR/conf.d/docker-php-ext-xdebug.ini" \
    && echo "xdebug.idekey=PHPSTORM" >> "$PHP_INI_DIR/conf.d/docker-php-ext-xdebug.ini"

# Install the Symfony VarDumper component
RUN curl -sS https://getcomposer.org/installer | php -- --install-dir=/usr/local/bin --filename=composer \
    && cd /var/www \
    && php /usr/local/bin/composer require symfony/var-dumper \
    && echo "auto_prepend_file=/var/www/vendor/autoload.php" >> "$PHP_INI_DIR/php.ini-development"

# Install BlackFire extension
RUN version=$(php -r "echo PHP_MAJOR_VERSION.PHP_MINOR_VERSION;") \
    && curl -A "Docker" -o /tmp/blackfire-probe.tar.gz -D - -L -s https://blackfire.io/api/v1/releases/probe/php/linux/amd64/$version \
    && mkdir -p /tmp/blackfire \
    && tar zxpf /tmp/blackfire-probe.tar.gz -C /tmp/blackfire \
    && mv /tmp/blackfire/blackfire-*.so $(php -r "echo ini_get ('extension_dir');")/blackfire.so \
    && printf "extension=blackfire.so\nblackfire.agent_socket=tcp://blackfire:8707\n" > $PHP_INI_DIR/conf.d/blackfire.ini \
    && rm -rf /tmp/blackfire /tmp/blackfire-probe.tar.gz

# Install WP CLI
RUN curl -O https://raw.githubusercontent.com/wp-cli/builds/gh-pages/phar/wp-cli.phar \
    && chmod +x wp-cli.phar \
    && mv wp-cli.phar /usr/local/bin/wp

# Cleanup
RUN apt-get clean
RUN rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*

# Use the default development configuration
RUN mv "$PHP_INI_DIR/php.ini-development" "$PHP_INI_DIR/php.ini"

# Manage EntryPoint file
COPY entrypoint.sh /bin/php-entrypoint.sh
RUN ["chmod", "+x", "/bin/php-entrypoint.sh"]
ENTRYPOINT ["/bin/php-entrypoint.sh"]
CMD ["php-fpm"]