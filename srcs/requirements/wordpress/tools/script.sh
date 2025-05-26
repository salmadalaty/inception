#!/bin/bash

mkdir -p /var/www/html
cd /var/www/html

# Download wp-cli
curl -O https://raw.githubusercontent.com/wp-cli/builds/gh-pages/phar/wp-cli.phar
chmod +x wp-cli.phar
mv wp-cli.phar /usr/local/bin/wp

# Download WordPress core files
wp core download --allow-root

# Prepare wp-config.php
cp wp-config-sample.php wp-config.php
sed -i "s/database_name_here/$MYSQL_DATABASE/" wp-config.php
sed -i "s/username_here/$MYSQL_USER/" wp-config.php
sed -i "s/password_here/$MYSQL_PASSWORD/" wp-config.php
sed -i "s/localhost/mariadb/" wp-config.php

# Wait for MariaDB to be ready
echo "⏳ Waiting for MariaDB to be ready..."
until wp db check --allow-root; do
  echo "Waiting for DB..."
  sleep 2
done

# Run WP install
wp core install \
  --url=$DOMAIN_NAME \
  --title="$WP_TITLE" \
  --admin_user=$WP_AD \
  --admin_password=$WP_AD_PASS \
  --admin_email=$AD_MAIL \
  --skip-email \
  --allow-root

# Fix php-fpm port
sed -i 's|listen = /run/php/php7.4-fpm.sock|listen = 9000|' /etc/php/7.4/fpm/pool.d/www.conf
mkdir -p /run/php

php-fpm7.4 -F
