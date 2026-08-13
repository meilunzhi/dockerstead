ARG PY_VERSION=3.14.7
FROM python:${PY_VERSION}-slim

ARG TZ

# Install the same basic development tools used by the Go service.
RUN apt-get update \
    && apt-get install -y --no-install-recommends git make curl build-essential tzdata \
    && rm -rf /var/lib/apt/lists/*

# Set timezone when TZ is provided by Compose.
RUN if [ -n "$TZ" ]; then \
        cp "/usr/share/zoneinfo/$TZ" /etc/localtime \
        && echo "$TZ" > /etc/timezone; \
    fi

ENV PYTHONDONTWRITEBYTECODE=1 \
    PYTHONUNBUFFERED=1 \
    PIP_DISABLE_PIP_VERSION_CHECK=1

WORKDIR /www
