FROM dunglas/frankenphp:1.12.1-php8.3

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
    memcache

RUN curl -o /usr/bin/composer https://getcomposer.org/download/2.9.5/composer.phar \
    && chmod +x /usr/bin/composer
ENV COMPOSER_HOME=/tmp/composer

# 工作目录
WORKDIR /www

# 暴露端口
EXPOSE 80 443 8083 8043

# 启动 FrankenPHP 服务器
ENTRYPOINT []
CMD ["/usr/local/bin/frankenphp", "run", "--config", "/etc/caddy/Caddyfile", "--adapter", "caddyfile"]
