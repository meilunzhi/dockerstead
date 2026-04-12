#!/usr/bin/env bash
# ============================================
# Docker Homestead 初始化脚本
# ============================================

set -e

# 颜色定义
RED='\033[0;31m'
GREEN='\033[0;32m'
YELLOW='\033[1;33m'
BLUE='\033[0;34m'
NC='\033[0m'

echo -e "${BLUE}============================================${NC}"
echo -e "${BLUE}   Docker Laravel Homestead 初始化脚本      ${NC}"
echo -e "${BLUE}============================================${NC}"

# 检查 Docker
if ! command -v docker &> /dev/null; then
    echo -e "${RED}❌ Docker 未安装，请先安装 Docker${NC}"
    exit 1
fi

if ! command -v docker-compose &> /dev/null; then
    echo -e "${RED}❌ Docker Compose 未安装，请先安装 Docker Compose${NC}"
    exit 1
fi

# 创建目录结构
echo -e "${YELLOW}📁 创建目录结构...${NC}"
mkdir -p projects
mkdir -p logs/{nginx,mysql,php}
mkdir -p nginx/ssl
mkdir -p mysql
mkdir -p postgres
mkdir -p redis
mkdir -p php

# 复制环境配置文件
if [ ! -f .env ]; then
    echo -e "${YELLOW}📝 复制环境配置文件...${NC}"
    cp .env.example .env
fi

# 生成 SSL 证书（可选）
if [ ! -f nginx/ssl/cert.pem ]; then
    echo -e "${YELLOW}🔐 生成自签名 SSL 证书...${NC}"
    openssl req -x509 -nodes -days 365 -newkey rsa:2048 \
        -keyout nginx/ssl/key.pem \
        -out nginx/ssl/cert.pem \
        -subj "/C=CN/ST=Shanghai/L=Shanghai/O=DockerHomestead/CN=localhost"
fi

# 创建示例 Laravel 项目
if [ ! -d projects/homestead ]; then
    echo -e "${YELLOW}📦 创建示例 Laravel 项目...${NC}"

    # 使用 Composer 创建 Laravel 项目
    docker run --rm \
        -v "$(pwd)/projects:/app" \
        -w /app \
        composer create-project laravel/laravel homestead --prefer-dist --no-interaction || {

        # 如果 Composer 失败，创建基本结构
        mkdir -p projects/homestead/{app,bootstrap,config,database,public,resources,routes,storage,tests}

        # 创建基本的 public/index.php
        cat > projects/homestead/public/index.php << 'LARAVEL_INDEX'
<?php

use Illuminate\Http\Request;

define('LARAVEL_START', microtime(true));

// Composer 自动加载
require __DIR__.'/../vendor/autoload.php';

// 创建应用
$app = new Illuminate\Foundation\Application(
    $_ENV['APP_BASE_PATH'] ?? dirname(__DIR__)
);

// 绑定 HTTP 内核
$kernel = $app->make(Illuminate\Contracts\Http\Kernel::class);

// 处理请求
$response = $kernel->handle(
    $request = Request::capture()
)->send();

// 终止
$kernel->terminate($request, $response);
LARAVEL_INDEX

        echo -e "${YELLOW}   Laravel 项目结构已创建${NC}"
    }
fi

# 设置权限
echo -e "${YELLOW}🔧 设置文件权限...${NC}"
chmod -R 755 projects
chmod -R 777 projects/homestead/storage 2>/dev/null || true
chmod -R 777 projects/homestead/bootstrap/cache 2>/dev/null || true

# 构建并启动容器
echo -e "${YELLOW}🚀 构建并启动 Docker 容器...${NC}"
docker-compose down -v 2>/dev/null || true
docker-compose build --no-cache
docker-compose up -d

# 等待服务启动
echo -e "${YELLOW}⏳ 等待服务启动...${NC}"
sleep 10

# 检查服务状态
echo -e "${YELLOW}🔍 检查服务状态...${NC}"
docker-compose ps

# 测试连接
echo -e "${YELLOW}🧪 测试服务连接...${NC}"

# 测试 MySQL
if docker exec homestead_mysql mysqladmin ping -h localhost -uroot -psecret &>/dev/null; then
    echo -e "${GREEN}✅ MySQL 连接成功${NC}"
else
    echo -e "${RED}❌ MySQL 连接失败${NC}"
fi

# 测试 Redis
if docker exec homestead_redis redis-cli -a secret ping &>/dev/null; then
    echo -e "${GREEN}✅ Redis 连接成功${NC}"
else
    echo -e "${RED}❌ Redis 连接失败${NC}"
fi

# 测试 Nginx
if curl -s http://localhost/health &>/dev/null; then
    echo -e "${GREEN}✅ Nginx 运行正常${NC}"
else
    echo -e "${RED}❌ Nginx 连接失败${NC}"
fi

echo ""
echo -e "${GREEN}============================================${NC}"
echo -e "${GREEN}   Docker Homestead 启动完成！              ${NC}"
echo -e "${GREEN}============================================${NC}"
echo ""
echo -e "${BLUE}📌 访问地址：${NC}"
echo -e "   - Web:       http://localhost"
echo -e "   - HTTPS:     https://localhost (需要配置 SSL)"
echo -e "   - Mailpit:   http://localhost:8025"
echo -e "   - MinIO:     http://localhost:9001"
echo -e "   - Meilisearch: http://localhost:7700"
echo ""
echo -e "${BLUE}📌 数据库连接：${NC}"
echo -e "   - MySQL:     localhost:3306 (homestead/secret)"
echo -e "   - PostgreSQL: localhost:5432 (homestead/secret)"
echo -e "   - Redis:     localhost:6379 (密码: secret)"
echo ""
echo -e "${BLUE}📌 常用命令：${NC}"
echo -e "   - 启动:   docker-compose up -d"
echo -e "   - 停止:   docker-compose down"
echo -e "   - 日志:   docker-compose logs -f"
echo -e "   - SSH:    docker exec -it homestead_php bash"
echo -e "   - Artisan: docker exec homestead_php php artisan"
echo ""