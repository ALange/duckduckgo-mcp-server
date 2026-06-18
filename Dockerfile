FROM python:3.13-slim

WORKDIR /app

COPY . /app

RUN pip install --no-cache-dir --upgrade pip \
    && pip install --no-cache-dir ".[browser]"

EXPOSE 7070

CMD ["python", "-m", "duckduckgo_mcp_server.server", \
     "--transport", "streamable-http", \
     "--host", "0.0.0.0", \
     "--port", "7070", \
     "--fetch-backend", "curl"]
