<?php

/**
 * Laravel - FrankenPHP 示例
 *
 * 此文件是 Laravel 应用的入口点
 * 实际项目中请替换为 Laravel 框架
 */

echo '<pre>';
echo "FrankenPHP 正在运行！\n";
echo "Domain: " . ($_SERVER['HTTP_HOST'] ?? 'unknown') . "\n";
echo "Server: " . ($_SERVER['SERVER_SOFTWARE'] ?? 'unknown') . "\n";
echo "PHP Version: " . PHP_VERSION . "\n";
echo "Document Root: " . dirname(__DIR__) . "\n";
echo '</pre>';

echo "<h1>local.laravel-api.testing</h1>";
echo "<p>FrankenPHP 多项目配置示例</p>";
echo "<p>项目目录: /www/laravel</p>";

// 显示请求信息
echo "<h2>请求信息</h2>";
echo "<table border='1' cellpadding='5'>";
echo "<tr><td>Request URI</td><td>" . ($_SERVER['REQUEST_URI'] ?? '-') . "</td></tr>";
echo "<tr><td>Request Method</td><td>" . ($_SERVER['REQUEST_METHOD'] ?? '-') . "</td></tr>";
echo "<tr><td>Server Protocol</td><td>" . ($_SERVER['SERVER_PROTOCOL'] ?? '-') . "</td></tr>";
echo "</table>";
