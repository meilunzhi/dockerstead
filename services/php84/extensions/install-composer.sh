#!/bin/sh

curl -o /tmp/composer-setup.php https://getcomposer.org/installer  \
&& php /tmp/composer-setup.php --install-dir=/tmp \
&& mv /tmp/composer.phar /usr/bin/composer \
&& chmod +x /usr/bin/composer \
&& rm -rf /tmp/composer-setup.php
