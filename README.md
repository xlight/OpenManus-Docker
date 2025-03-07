# OpenManus-Docker
OpenManus Dockerfile and docker compose yml.



### 使用说明
1. **准备工作**：
   - 在项目根目录下创建 `Dockerfile` 和 `docker-compose.yml` 文件。
   - 确保 `requirements.txt` 文件在同一目录下。
   - 创建 `config` 文件夹，并将 `config.example.toml` 复制到 `config/config.toml`，然后编辑其中的 API 密钥等配置。

2. **构建和运行**：
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

3. **自定义配置**：
   - **通过配置文件**：编辑 `config/config.toml` 文件，设置 API 密钥和其他参数。
   - **通过环境变量**：在 `docker-compose.yml` 中设置 `environment` 下的变量，这些变量会在运行时覆盖默认配置。

4. **运行开发版本**：
   - 修改 `docker-compose.yml` 中的 `command` 为 `["python", "run_flow.py"]`，然后重新运行：
     ```bash
     docker-compose up --build
     ```

### 注意事项
- **API 密钥安全**：建议通过环境变量或挂载的配置文件传入 API 密钥，而不是硬编码到 Dockerfile 中。
- **存储持久化**：当前配置未设置数据卷持久化存储。如果需要保存运行时生成的文件，可添加额外的 `volumes` 配置。
- **网络需求**：确保容器有权访问 `https://api.openai.com/v1` 或您配置的其他 LLM API 地址。

