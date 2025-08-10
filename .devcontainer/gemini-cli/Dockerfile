FROM debian:12.10-slim

ARG USER=vscode
ARG GROUP=${USER}
ARG UID
ARG GID
ARG WORKDIR=/app

RUN apt-get update && \
    apt-get install -y --no-install-recommends \
    bash-completion=1:2.11-6 \
    sudo=1.9.13p3-1+deb12u1 && \
    apt-get clean && \
    rm -rf /var/lib/apt/lists/*

RUN groupadd --gid ${GID} ${GROUP} && \
    useradd --uid ${UID} --gid ${GID} --groups sudo --shell /bin/bash --create-home ${USER} && \
    echo "$USER ALL=(ALL) NOPASSWD:ALL" >> /etc/sudoers

USER ${USER}
WORKDIR ${WORKDIR}
