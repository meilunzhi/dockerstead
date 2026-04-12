#!/usr/bin/env dockerfile

# ============================================
# Docker Laravel Homestead
# PHP 8.1 - 8.4 | MySQL 8 | Redis | Nginx
# ============================================

# 基础镜像
FROM ubuntu:24.04 AS base

# 防止交互式安装
ENV DEBIAN_FRONTEND=noninteractive
ENV LC_ALL=en_US.UTF-8
ENV LANG=en_US.UTF-8

# 设置时区
ENV TZ=Asia/Shanghai

# ============================================
# 基础层 - 系统包
# ============================================
FROM base AS system

# 更新源并安装基础包
RUN apt-get update && apt-get install -y \
    build-essential \
    curl \
    wget \
    vim \
    git \
    git-lfs \
    unzip \
    zip \
    unzip \
    sudo \
    net-tools \
    iputils-ping \
    telnet \
    htop \
    tree \
    jq \
    rsync \
    ca-certificates \
    gnupg \
    lsb-release \
    software-properties-common \
    apt-transport-https \
    dos2unix \
    gcc \
    g++ \
    make \
    cmake \
    re2c \
    chrony \
    supervisor \
    unattended-upgrades \
    whois \
    pwgen \
    cifs-utils \
    bash-completion \
    zsh \
    graphviz \
    avahi-daemon \
    tshark \
    python3 \
    python3-pip \
    python3-venv \
    python3-dev \
    mysql-client \
    postgresql-client \
    sqlite3 \
    libsqlite3-dev \
    libpng-dev \
    libjpeg-dev \
    libfreetype6-dev \
    libmcrypt4 \
    libpcre3-dev \
    libzip-dev \
    libonig-dev \
    libxml2-dev \
    libcurl4-openssl-dev \
    libssl-dev \
    libldap2-dev \
    libenchant-2-dev \
    libhunspell-dev \
    libpspell-dev \
    libtidy-dev \
    libxslt1-dev \
    libyaml-dev \
    libmagickwand-dev \
    imagemagick \
    && rm -rf /var/lib/apt/lists/*

# 设置时区
RUN ln -sf /usr/share/zoneinfo/$TZ /etc/localtime

# 配置 Locales
RUN locale-gen en_US.UTF-8 && \
    update-locale LANG=en_US.UTF-8

# ============================================
# PHP 层 - 8.1
# ============================================
FROM system AS php81

# 添加 PPA
RUN add-apt-repository ppa:ondrej/php -y

# 安装 PHP 8.1
RUN apt-get update && apt-get install -y \
    php8.1 \
    php8.1-cli \
    php8.1-common \
    php8.1-fpm \
    php8.1-mysql \
    php8.1-pgsql \
    php8.1-sqlite3 \
    php8.1-bcmath \
    php8.1-bz2 \
    php8.1-cgi \
    php8.1-dba \
    php8.1-enchant \
    php8.1-gd \
    php8.1-gmp \
    php8.1-imap \
    php8.1-interbase \
    php8.1-intl \
    php8.1-ldap \
    php8.1-mbstring \
    php8.1-odbc \
    php8.1-opcache \
    php8.1-phpdbg \
    php8.1-pspell \
    php8.1-readline \
    php8.1-snmp \
    php8.1-soap \
    php8.1-sybase \
    php8.1-tidy \
    php8.1-xdebug \
    php8.1-xml \
    php8.1-xmlrpc \
    php8.1-xsl \
    php8.1-zip \
    php8.1-imagick \
    php8.1-memcached \
    php8.1-redis \
    php8.1-curl \
    php8.1-dev \
    && rm -rf /var/lib/apt/lists/*

# ============================================
# PHP 层 - 8.2
# ============================================
FROM system AS php82

RUN add-apt-repository ppa:ondrej/php -y

RUN apt-get update && apt-get install -y \
    php8.2 \
    php8.2-cli \
    php8.2-common \
    php8.2-fpm \
    php8.2-mysql \
    php8.2-pgsql \
    php8.2-sqlite3 \
    php8.2-bcmath \
    php8.2-bz2 \
    php8.2-cgi \
    php8.2-dba \
    php8.2-enchant \
    php8.2-gd \
    php8.2-gmp \
    php8.2-imap \
    php8.2-interbase \
    php8.2-intl \
    php8.2-ldap \
    php8.2-mbstring \
    php8.2-odbc \
    php8.2-opcache \
    php8.2-phpdbg \
    php8.2-pspell \
    php8.2-readline \
    php8.2-snmp \
    php8.2-soap \
    php8.2-sybase \
    php8.2-tidy \
    php8.2-xdebug \
    php8.2-xml \
    php8.2-xmlrpc \
    php8.2-xsl \
    php8.2-zip \
    php8.2-imagick \
    php8.2-memcached \
    php8.2-redis \
    php8.2-curl \
    php8.2-dev \
    && rm -rf /var/lib/apt/lists/*

# ============================================
# PHP 层 - 8.3
# ============================================
FROM system AS php83

RUN add-apt-repository ppa:ondrej/php -y

RUN apt-get update && apt-get install -y \
    php8.3 \
    php8.3-cli \
    php8.3-common \
    php8.3-fpm \
    php8.3-mysql \
    php8.3-pgsql \
    php8.3-sqlite3 \
    php8.3-bcmath \
    php8.3-bz2 \
    php8.3-cgi \
    php8.3-dba \
    php8.3-enchant \
    php8.3-gd \
    php8.3-gmp \
    php8.3-imap \
    php8.3-interbase \
    php8.3-intl \
    php8.3-ldap \
    php8.3-mbstring \
    php8.3-odbc \
    php8.3-opcache \
    php8.3-phpdbg \
    php8.3-pspell \
    php8.3-readline \
    php8.3-snmp \
    php8.3-soap \
    php8.3-sybase \
    php8.3-tidy \
    php8.3-xdebug \
    php8.3-xml \
    php8.3-xmlrpc \
    php8.3-xsl \
    php8.3-zip \
    php8.3-imagick \
    php8.3-memcached \
    php8.3-redis \
    php8.3-curl \
    php8.3-dev \
    && rm -rf /var/lib/apt/lists/*

# ============================================
# PHP 层 - 8.4
# ============================================
FROM system AS php84

RUN add-apt-repository ppa:ondrej/php -y

RUN apt-get update && apt-get install -y \
    php8.4 \
    php8.4-cli \
    php8.4-common \
    php8.4-fpm \
    php8.4-mysql \
    php8.4-pgsql \
    php8.4-sqlite3 \
    php8.4-bcmath \
    php8.4-bz2 \
    php8.4-cgi \
    php8.4-dba \
    php8.4-enchant \
    php8.4-gd \
    php8.4-gmp \
    php8.4-imap \
    php8.4-interbase \
    php8.4-intl \
    php8.4-ldap \
    php8.4-mbstring \
    php8.4-odbc \
    php8.4-opcache \
    php8.4-phpdbg \
    php8.4-pspell \
    php8.4-readline \
    php8.4-snmp \
    php8.4-soap \
    php8.4-sybase \
    php8.4-tidy \
    php8.4-xdebug \
    php8.4-xml \
    php8.4-xmlrpc \
    php8.4-xsl \
    php8.4-zip \
    php8.4-imagick \
    php8.4-memcached \
    php8.4-redis \
    php8.4-curl \
    php8.4-dev \
    && rm -rf /var/lib/apt/lists/*

# ============================================
# 最终镜像 - 默认 PHP 8.4
# ============================================
FROM php84 AS final

# 设置工作目录
WORKDIR /var/www/html

# 安装 Node.js 22.x
RUN curl -fsSL https://deb.nodesource.com/gpgkey/nodesource-repo.gpg.key | gpg --dearmor -o /usr/share/keyrings/nodesource.gpg && \
    echo "deb [signed-by=/usr/share/keyrings/nodesource.gpg] https://deb.nodesource.com/node_22.x nodistro main" > /etc/apt/sources.list.d/nodesource.list && \
    apt-get update && apt-get install -y nodejs && \
    npm install -g yarn pnpm gulp-cli bower grunt-cli && \
    rm -rf /var/lib/apt/lists/*

# 安装 Composer
RUN curl -sS https://getcomposer.org/installer | php && \
    mv composer.phar /usr/local/bin/composer && \
    chmod +x /usr/local/bin/composer

# 全局 Composer 包
RUN composer global require laravel/installer \
    laravel/envoy \
    phpunit/phpunit \
    --no-interaction \
    --prefer-dist

# 添加 Composer 全局 bin 到 PATH
ENV PATH="/root/.composer/vendor/bin:${PATH}"

# 安装 Nginx
RUN apt-get update && apt-get install -y nginx && \
    rm -rf /var/lib/apt/lists/*

# 配置 Nginx
COPY nginx/default.conf /etc/nginx/sites-available/default
COPY nginx/default-ssl.conf /etc/nginx/snippets/self-signed.conf

# 安装 Redis
RUN apt-get update && apt-get install -y redis-server && \
    rm -rf /var/lib/apt/lists/*

# 配置 Redis
RUN echo "requirepass secret" >> /etc/redis/redis.conf && \
    sed -i 's/bind 127.0.0.1/bind 0.0.0.0/' /etc/redis/redis.conf

# 安装 Memcached
RUN apt-get update && apt-get install -y memcached && \
    rm -rf /var/lib/apt/lists/*

# 安装 Beanstalkd
RUN apt-get update && apt-get install -y beanstalkd && \
    rm -rf /var/lib/apt/lists/*

# 配置 Beanstalkd
RUN sed -i 's/#START=yes/START=yes/' /etc/default/beanstalkd

# 安装 Go
RUN wget -q https://go.dev/dl/go1.22.5.linux-amd64.tar.gz && \
    tar -C /usr/local -xzf go1.22.5.linux-amd64.tar.gz && \
    rm go1.22.5.linux-amd64.tar.gz

ENV PATH="/usr/local/go/bin:${PATH}"
ENV GOPATH="/root/go"
ENV PATH="${GOPATH}/bin:${PATH}"

# 安装 wp-cli
RUN curl -O https://raw.githubusercontent.com/wp-cli/builds/gh-pages/phar/wp-cli.phar && \
    chmod +x wp-cli.phar && \
    mv wp-cli.phar /usr/local/bin/wp

# 复制 PHP 配置
COPY php/php.ini /etc/php/8.4/cli/conf.d/99-custom.ini
COPY php/php.ini /etc/php/8.4/fpm/conf.d/99-custom.ini
COPY php/xdebug.ini /etc/php/8.4/mods-available/xdebug.ini

# 配置 PHP-FPM
RUN mkdir -p /var/run/php && \
    chown -R www-data:www-data /var/run/php

# 配置 Supervisor
RUN mkdir -p /etc/supervisor/conf.d

COPY supervisor/supervisord.conf /etc/supervisor/supervisord.conf
COPY supervisor/*.conf /etc/supervisor/conf.d/

# 创建日志目录
RUN mkdir -p /var/log/supervisor && \
    mkdir -p /var/log/php-fpm && \
    mkdir -p /var/log/nginx

# 暴露端口
EXPOSE 80 443 3306 5432 6379 9000 8025

# 健康检查
HEALTHCHECK --interval=30s --timeout=10s --start-period=5s --retries=3 \
    CMD curl -f http://localhost/health || exit 1

# 启动命令
CMD ["/usr/bin/supervisord", "-c", "/etc/supervisor/supervisord.conf"]