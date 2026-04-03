# syntax=docker/dockerfile:1
FROM dunglas/frankenphp:latest

# 设置时区
ENV TZ=Asia/Shanghai \
    DEBIAN_FRONTEND=noninteractive

# 安装 Composer
RUN curl -sS https://getcomposer.org/installer | php \
    && mv composer.phar /usr/local/bin/composer \
    && chmod +x /usr/local/bin/composer \
    && composer config -g repo.packagist composer https://packagist.phpcomposer.com

# 安装 PHP 扩展（分开安装）
RUN pecl install redis && docker-php-ext-enable redis
RUN pecl install xdebug && docker-php-ext-enable xdebug

WORKDIR /www

EXPOSE 80 443 8085 8045 443/udp

ENTRYPOINT []
CMD ["/usr/local/bin/frankenphp", "run", "--config", "/etc/caddy/Caddyfile", "--adapter", "caddyfile"]
