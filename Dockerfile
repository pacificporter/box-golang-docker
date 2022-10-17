FROM golang:1.19.2

# `debconf: delaying package configuration, since apt-utils is not installed` を抑止する
ENV DEBCONF_NOWARNINGS yes

RUN apt-get update \
    && apt-get install -y --no-install-recommends chromium rsync unzip patch jq \
    && rm -rf /var/lib/apt/lists/* \
    && rm -rf /var/cache/apt/archives/* \
    && curl -fsSL https://github.com/cli/cli/releases/download/v2.14.7/gh_2.14.7_linux_amd64.deb | dd of=/tmp/gh_2.14.7_linux_amd64.deb \
    && dpkg -i /tmp/gh_2.14.7_linux_amd64.deb \
    && go install github.com/github-release/github-release@latest \
    && go install github.com/pressly/goose/v3/cmd/goose@latest \
    && go install github.com/rubenv/sql-migrate/...@latest \
    && curl -L git.io/nodebrew | perl - setup \
    && $HOME/.nodebrew/current/bin/nodebrew install-binary v14.20.1 \
    && $HOME/.nodebrew/current/bin/nodebrew use v14.20.1 \
    && rm -rf /tmp/* \
    && curl "https://awscli.amazonaws.com/awscli-exe-linux-x86_64.zip" -o "awscliv2.zip" \
    && unzip awscliv2.zip \
    && ./aws/install \
    && rm -rf ./awscliv2.zip ./aws
