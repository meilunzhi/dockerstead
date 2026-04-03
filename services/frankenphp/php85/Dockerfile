#FROM dunglas/frankenphp:1.12.1-php8.5
FROM dunglas/frankenphp:latest

# 设置时区
ENV TZ=Asia/Shanghai

# 安装常用扩展
RUN apt-get update && apt-get install -y \
    bash \
    openssl \
    ca-certificates \
    curl \
    zip \
    unzip \
    git \
    && rm -rf /var/lib/apt/lists/*

# 工作目录
WORKDIR /www

# 暴露端口
EXPOSE 80 443 8085 8045

# 启动 FrankenPHP 服务器
ENTRYPOINT []
CMD ["/usr/local/bin/frankenphp", "run", "--config", "/etc/caddy/Caddyfile", "--adapter", "caddyfile"]
