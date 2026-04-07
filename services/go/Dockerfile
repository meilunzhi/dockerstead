ARG GO_VERSION
FROM golang:1.26.1

ARG TZ
ARG GOPROXY=https://goproxy.cn,direct

# Install base tools
RUN apt-get update && apt-get install -y git make curl tzdata && rm -rf /var/lib/apt/lists/*

# Set timezone
RUN cp "/usr/share/zoneinfo/$TZ" /etc/localtime && echo "$TZ" > /etc/timezone

# Set Go environment
ENV GOPROXY=${GOPROXY}
ENV GO111MODULE=on
ENV CGO_ENABLED=1

WORKDIR /www