# Windows 11 C盘垃圾清理脚本
# 建议使用管理员身份运行

Write-Host "====================================="
Write-Host " Windows 11 C盘垃圾文件清理开始"
Write-Host "=====================================" -ForegroundColor Cyan

function Remove-Files {
    param (
        [string]$Path,
        [string]$Name
    )

    if (Test-Path $Path) {
        Write-Host "正在清理：$Name"
        try {
            Remove-Item -Path $Path -Recurse -Force -ErrorAction SilentlyContinue
            Write-Host "完成：$Name" -ForegroundColor Green
        } catch {
            Write-Host "清理失败：$Name" -ForegroundColor Yellow
        }
    } else {
        Write-Host "跳过：$Name，路径不存在"
    }
}

# 1. 清理当前用户临时文件
Remove-Files "$env:TEMP\*" "当前用户临时文件"

# 2. 清理系统临时文件
Remove-Files "C:\Windows\Temp\*" "系统临时文件"

# 3. 清理 Prefetch 预读取缓存
Remove-Files "C:\Windows\Prefetch\*" "系统预读取缓存"

# 4. 清理 Windows 更新下载缓存
Write-Host "正在停止 Windows Update 服务..."
Stop-Service -Name wuauserv -Force -ErrorAction SilentlyContinue
Stop-Service -Name bits -Force -ErrorAction SilentlyContinue

Remove-Files "C:\Windows\SoftwareDistribution\Download\*" "Windows 更新下载缓存"

Write-Host "正在启动 Windows Update 服务..."
Start-Service -Name bits -ErrorAction SilentlyContinue
Start-Service -Name wuauserv -ErrorAction SilentlyContinue

# 5. 清理 Delivery Optimization 缓存
Remove-Files "C:\Windows\ServiceProfiles\NetworkService\AppData\Local\Microsoft\Windows\DeliveryOptimization\Cache\*" "传递优化缓存"

# 6. 清理 Windows 错误报告
Remove-Files "C:\ProgramData\Microsoft\Windows\WER\*" "Windows 错误报告"

# 7. 清理缩略图缓存
Remove-Files "$env:LOCALAPPDATA\Microsoft\Windows\Explorer\thumbcache_*.db" "缩略图缓存"

# 8. 清理 DirectX Shader Cache
Remove-Files "$env:LOCALAPPDATA\D3DSCache\*" "DirectX Shader 缓存"

# 9. 清理 Edge 浏览器缓存
Remove-Files "$env:LOCALAPPDATA\Microsoft\Edge\User Data\Default\Cache\*" "Edge 浏览器缓存"
Remove-Files "$env:LOCALAPPDATA\Microsoft\Edge\User Data\Default\Code Cache\*" "Edge Code Cache"
Remove-Files "$env:LOCALAPPDATA\Microsoft\Edge\User Data\Default\GPUCache\*" "Edge GPU Cache"

# 10. 清理 Chrome 浏览器缓存
Remove-Files "$env:LOCALAPPDATA\Google\Chrome\User Data\Default\Cache\*" "Chrome 浏览器缓存"
Remove-Files "$env:LOCALAPPDATA\Google\Chrome\User Data\Default\Code Cache\*" "Chrome Code Cache"
Remove-Files "$env:LOCALAPPDATA\Google\Chrome\User Data\Default\GPUCache\*" "Chrome GPU Cache"

# 11. 清理 Firefox 缓存
Remove-Files "$env:LOCALAPPDATA\Mozilla\Firefox\Profiles\*\cache2\*" "Firefox 浏览器缓存"

# 12. 清空回收站
Write-Host "正在清空回收站..."
try {
    Clear-RecycleBin -Force -ErrorAction SilentlyContinue
    Write-Host "回收站清理完成" -ForegroundColor Green
} catch {
    Write-Host "回收站清理失败" -ForegroundColor Yellow
}

# 13. 启动 Windows 磁盘清理工具配置项
Write-Host "正在执行系统磁盘清理..."
try {
    cleanmgr /sagerun:1
} catch {
    Write-Host "磁盘清理工具执行失败" -ForegroundColor Yellow
}

Write-Host "====================================="
Write-Host " C盘垃圾文件清理完成"
Write-Host " 建议重启电脑以释放被占用文件"
Write-Host "=====================================" -ForegroundColor Cyan

Pause


