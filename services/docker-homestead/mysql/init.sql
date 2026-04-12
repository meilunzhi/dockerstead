-- ============================================
-- MySQL 初始化脚本
-- ============================================

-- 创建数据库
CREATE DATABASE IF NOT EXISTS `homestead`
    CHARACTER SET utf8mb4
    COLLATE utf8mb4_unicode_ci;

-- 创建用户
CREATE USER IF NOT EXISTS 'homestead'@'%' IDENTIFIED WITH mysql_native_password BY 'secret';
CREATE USER IF NOT EXISTS 'homestead'@'localhost' IDENTIFIED WITH mysql_native_password BY 'secret';

-- 授权
GRANT ALL PRIVILEGES ON *.* TO 'homestead'@'%' WITH GRANT OPTION;
GRANT ALL PRIVILEGES ON *.* TO 'homestead'@'localhost' WITH GRANT OPTION;
GRANT ALL PRIVILEGES ON `homestead`.* TO 'homestead'@'%';
GRANT ALL PRIVILEGES ON `homestead`.* TO 'homestead'@'localhost';

-- 刷新权限
FLUSH PRIVILEGES;

-- 设置时区
SET GLOBAL time_zone = '+08:00';
SET time_zone = '+08:00';