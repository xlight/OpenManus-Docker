# OpenManus-Docker
OpenManus Dockerfile and docker compose yml.



### 使用说明

1. **构建和运行**：
   - 构建镜像并启动容器：
     ```bash
     docker-compose up --build
     ```
   - 如果只需要构建镜像：
     ```bash
     docker-compose build
     ```
   - 单独运行容器：
     ```bash
     docker-compose run openmanus
     ```


2. **运行开发版本**：
   - 修改 `docker-compose.yml` 中的 `command` 为 `["python", "run_flow.py"]`，然后重新运行：
     ```bash
     docker-compose up --build
     ```

### 注意事项
- **API 密钥安全**：建议通过环境变量或挂载的配置文件传入 API 密钥，而不是硬编码到 Dockerfile 中。
- **存储持久化**：当前配置未设置数据卷持久化存储。如果需要保存运行时生成的文件，可添加额外的 `volumes` 配置。
- **网络需求**：确保容器有权访问 `https://api.openai.com/v1` 或您配置的其他 LLM API 地址。

