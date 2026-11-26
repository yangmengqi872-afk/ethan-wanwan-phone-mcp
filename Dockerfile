FROM python:3.12-slim

WORKDIR /app

COPY requirements.txt .
RUN pip install --no-cache-dir -r requirements.txt

COPY server.py .

# 数据目录：Railway 上挂 Volume 到 /data，重启不丢截图和状态
ENV PHONE_MCP_DATA_DIR=/data \
    PHONE_MCP_HOST=0.0.0.0

EXPOSE 8000

CMD ["sh", "-c", "uvicorn server:app --host 0.0.0.0 --port ${PORT:-8000}"]
