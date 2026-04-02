ARG GO_VERSION
#FROM golang:${GO_VERSION}-alpine
FROM golang:${GO_VERSION}

ARG TZ
ARG GOPROXY=https://goproxy.cn,direct

# Install base tools
RUN apk add --no-cache git make curl bash tzdata

# Set timezone
RUN cp "/usr/share/zoneinfo/$TZ" /etc/localtime && echo "$TZ" > /etc/timezone

# Set Go environment
ENV GOPROXY=${GOPROXY}
ENV GO111MODULE=on
ENV CGO_ENABLED=1

WORKDIR /www