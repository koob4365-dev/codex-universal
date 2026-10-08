# syntax=docker/dockerfile:1
FROM mcr.microsoft.com/devcontainers/typescript-node:24-bookworm

USER root
RUN apt-get update \
    && apt-get install -y --no-install-recommends \
       python3 python3-venv python3-pip ripgrep shellcheck jq gdb \
    && rm -rf /var/lib/apt/lists/*
ARG CODEX_VERSION=0.161.0
RUN --mount=type=secret,id=proxy_ca \
    if [ -f /run/secrets/proxy_ca ]; then \
      export NODE_EXTRA_CA_CERTS=/run/secrets/proxy_ca; \
    fi; \
    npm install --global "@openai/codex@${CODEX_VERSION}"
USER node
