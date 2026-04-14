FROM 1panel/1panel:latest

# 设置时区
ENV TZ=Asia/Shanghai

# 1Panel 需要的端口
EXPOSE 10086

# 设置工作目录
WORKDIR /opt

# 启动命令
CMD ["1panel", "serve"]