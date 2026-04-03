#FROM dunglas/frankenphp:1.12.1-php8.5
# syntax=docker/dockerfile:1
FROM dunglas/frankenphp:latest

# ============================================
# 设置时区和环境
# ============================================
ENV TZ=Asia/Shanghai \
    DEBIAN_FRONTEND=noninteractive

# ============================================
# 1. 安装系统依赖和编译工具
# ============================================
RUN apt-get update && apt-get install -y \
    build-essential \
    autoconf \
    pkg-config \
    bash \
    openssl \
    ca-certificates \
    curl \
    zip \
    unzip \
    git \
    libssl-dev \
    libsasl2-dev \
    libcurl4-openssl-dev \
    libxml2-dev \
    libzip-dev \
    libonig-dev \
    libicu-dev \
    libfreetype6-dev \
    libjpeg-dev \
    libpng-dev \
    && rm -rf /var/lib/apt/lists/* \
    && apt-get clean

# ============================================
# 2. 安装 Composer
# ============================================
RUN curl -sS https://getcomposer.org/installer | php \
    && mv composer.phar /usr/local/bin/composer \
    && chmod +x /usr/local/bin/composer \
    && composer config -g repo.packagist composer https://packagist.phpcomposer.com

# ============================================
# 3. 安装 PHP 扩展
# ============================================

# Redis (不指定版本，自动选择兼容版本)
RUN pecl install redis \
    && docker-php-ext-enable redis

# Xdebug
RUN pecl install xdebug \
    && docker-php-ext-enable xdebug

# MongoDB
RUN pecl install mongodb \
    && docker-php-ext-enable mongodb

# Swoole
RUN pecl install swoole \
    && docker-php-ext-enable swoole

# ============================================
# 4. 编译安装 PHP 扩展
# ============================================
RUN docker-php-ext-install \
    pdo_mysql \
    mysqli \
    opcache \
    zip \
    bcmath \
    intl \
    gd \
    mbstring \
    exif

# ============================================
# 5. 工作目录和文件
# ============================================
WORKDIR /www

# ============================================
# 6. 暴露端口
# ============================================
EXPOSE 80 443 8085 8045 443/udp

# ============================================
# 7. 启动命令
# ============================================
ENTRYPOINT []
CMD ["/usr/local/bin/frankenphp", "run", "--config", "/etc/caddy/Caddyfile", "--adapter", "caddyfile"]