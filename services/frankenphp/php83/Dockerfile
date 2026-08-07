FROM dunglas/frankenphp:1.12.4-php8.3

ARG IPE_PROCESSOR_COUNT=1
ENV IPE_PROCESSOR_COUNT=${IPE_PROCESSOR_COUNT}
#FROM dunglas/frankenphp-dev:php8.3

# 设置时区
ENV TZ=Asia/Shanghai

# 安装常用扩展
RUN install-php-extensions \
    gd \
    pdo_mysql \
    redis \
    zip \
    swoole \
    mongodb \
    memcached \
    memcache \
    xdebug \
    bcmath \
    exif \
    intl \
    mysqli \
    opcache \
    imagick

RUN mkdir -p /var/log/php \
    && { \
        echo "zend_extension=xdebug.so"; \
        echo "xdebug.mode=debug"; \
        echo "xdebug.discover_client_host=true"; \
        echo "xdebug.start_with_request=yes"; \
        echo "xdebug.show_exception_trace=On"; \
        echo "xdebug.client_port=9003"; \
        echo "xdebug.idekey=PHPSTORM"; \
        echo "xdebug.log=/var/log/php/xdebug.log"; \
        echo "xdebug.client_host=192.168.0.105"; \
        echo "xdebug.max_nesting_level=512"; \
        echo "xdebug.scream=0"; \
        echo "xdebug.cli_color=1"; \
        echo "xdebug.show_local_vars=1"; \
    } > /usr/local/etc/php/conf.d/docker-php-ext-xdebug.ini \
    && touch /var/log/php/xdebug.log

RUN curl -o /usr/bin/composer https://getcomposer.org/download/2.10.2/composer.phar \
    && chmod +x /usr/bin/composer
ENV COMPOSER_HOME=/tmp/composer

# 工作目录
WORKDIR /www

# 暴露端口
EXPOSE 80 443 8083 8043

# 启动 FrankenPHP 服务器
ENTRYPOINT []
CMD ["/usr/local/bin/frankenphp", "run", "--config", "/etc/caddy/Caddyfile", "--adapter", "caddyfile"]
