#!/bin/bash

    mkdir /var/www/
    mkdir /var/www/html

    cd /var/www/html

    # Install WordPress commands line tool

    curl -O https://raw.githubusercontent.com/wp-cli/builds/gh-pages/phar/wp-cli.phar 

    chmod +x wp-cli.phar 
    mv wp-cli.phar /usr/local/bin/wp
    # Download WordPress
    wp core download --allow-root
,
    mv /var/www/html/wp-config-sample.php /var/www/html/wp-config.php

#sed  stream editor. It's used to search and replace lines in a file.
    sed -i "s/define( 'DB_NAME', 'database_name_here' );/define( 'DB_NAME', '$MYSQL_DATABASE' );/" wp-config.php

    sed -i "s/define( 'DB_USER', 'username_here' );/define( 'DB_USER', '$MYSQL_USER' );/" wp-config.php

    sed -i "s/define( 'DB_PASSWORD', 'password_here' );/define( 'DB_PASSWORD', '$MYSQL_PASSWORD' );/" wp-config.php

    sed -i "s/localhost/mariadb/" wp-config.php
    sleep 5


    wp core install --url=$DOMAIN_NAME/ --title=$WP_TITLE --admin_user=$WP_AD --admin_password=$WP_AD_PASS --admin_email=$AD_MAIL --skip-email --allow-root

    sed -i 's/listen = \/run\/php\/php7.4-fpm.sock/listen = 9000/g' /etc/php/7.4/fpm/pool.d/www.conf
    mkdir /run/php

    php-fpm7.4 -F