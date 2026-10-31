FROM alpine:latest

RUN apk add --no-cache \
    ca-certificates \
    curl \
    unzip

RUN curl -L https://github.com/XTLS/xray-core/releases/latest/download/xray-linux-64.zip \
    -o /tmp/xray.zip && \
    unzip -o /tmp/xray.zip -d /usr/local/bin && \
    rm /tmp/xray.zip && \
    chmod +x /usr/local/bin/xray

COPY config.json /etc/xray/config.json

EXPOSE 8080

CMD ["xray", "run", "-config", "/etc/xray/config.json"]
