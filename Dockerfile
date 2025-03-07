# 使用官方 Python 3.12 镜像作为基础镜像
FROM python:3.12-slim

# 设置工作目录
WORKDIR /app

# 安装系统依赖和 git
RUN apt-get update && apt-get install -y \
    git \
    && rm -r /var/lib/apt/lists/*

# 克隆 OpenManus 仓库
RUN git clone https://github.com/mannaandpoem/OpenManus.git .

# 安装 Python 依赖
COPY requirements.txt .
RUN pip install --no-cache-dir -r requirements.txt

# 复制配置文件模板
COPY config/config.example.toml config/config.toml

# 设置环境变量（可选，API 密钥等可在运行时通过 docker-compose 或环境变量传入）
# ENV API_KEY="sk-..."

# 暴露可能的端口（如果将来有 Web 接口需求，默认无端口暴露）
# EXPOSE 8080

# 启动命令
CMD ["python", "main.py"]