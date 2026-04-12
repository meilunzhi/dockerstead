# Docker Laravel Homestead

一个现代化的 Docker 版 Laravel 开发环境，完美替代传统 Vagrant Homestead。

## 🚀 特性

- **多 PHP 版本**: PHP 8.1 - 8.4
- **多数据库**: MySQL 8, PostgreSQL 16, SQLite
- **完整缓存栈**: Redis 7, Memcached
- **开发者工具**:
    - Mailpit (邮件调试)
    - MinIO (S3 兼容存储)
    - Meilisearch (全文搜索)
    - Beanstalkd (队列)
- **现代架构**: Docker Compose 编排
- **Xdebug 支持**: 开箱即用的调试环境

## 📋 要求

- Docker 20.10+
- Docker Compose 2.0+
- 4GB+ RAM
- 20GB+ 可用磁盘空间

## 🚀 快速开始

### 1. 克隆项目

```bash
git clone https://github.com/your-repo/docker-homestead.git
cd docker-homestead