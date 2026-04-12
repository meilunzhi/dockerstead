-- ============================================
-- PostgreSQL 初始化脚本
-- ============================================

-- 创建扩展
CREATE EXTENSION IF NOT EXISTS "uuid-ossp";
CREATE EXTENSION IF NOT EXISTS "pg_trgm";

-- 创建超级用户
ALTER USER postgres WITH PASSWORD 'secret';
CREATE USER homestead WITH PASSWORD 'secret' SUPERUSER CREATEDB CREATEROLE REPLICATION;

-- 创建数据库
CREATE DATABASE homestead OWNER homestead;

-- 连接到 homestead 数据库
\c homestead

-- 授予权限
GRANT ALL PRIVILEGES ON DATABASE homestead TO homestead;
GRANT ALL PRIVILEGES ON ALL TABLES IN SCHEMA public TO homestead;
GRANT ALL PRIVILEGES ON ALL SEQUENCES IN SCHEMA public TO homestead;