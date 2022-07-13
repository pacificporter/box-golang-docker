FROM golang:1.18.4
MAINTAINER HARUYAMA Seigo <haruyama@pacificporter.jp>

# `debconf: delaying package configuration, since apt-utils is not installed` を抑止する
ENV DEBCONF_NOWARNINGS yes

RUN curl -fsSL https://cli.github.com/packages/githubcli-archive-keyring.gpg | dd of=/usr/share/keyrings/githubcli-archive-keyring.gpg \
    && echo "deb [arch=$(dpkg --print-architecture) signed-by=/usr/share/keyrings/githubcli-archive-keyring.gpg] https://cli.github.com/packages stable main" | tee /etc/apt/sources.list.d/github-cli.list > /dev/null \
    && apt-get update \
    && apt-get install -y --no-install-recommends chromium rsync gh unzip patch \
    && rm -rf /var/lib/apt/lists/* \
    && rm -rf /var/cache/apt/archives/* \
    && go install github.com/github-release/github-release@latest \
    && go install github.com/pressly/goose/v3/cmd/goose@latest \
    && go install github.com/rubenv/sql-migrate/...@latest \
    && curl -L git.io/nodebrew | perl - setup \
    && $HOME/.nodebrew/current/bin/nodebrew install-binary v14.20.0 \
    && $HOME/.nodebrew/current/bin/nodebrew use v14.20.0 \
    && rm -rf /tmp/* \
    && curl "https://awscli.amazonaws.com/awscli-exe-linux-x86_64.zip" -o "awscliv2.zip" \
    && unzip awscliv2.zip \
    && ./aws/install \
    && rm -rf ./awscliv2.zip ./aws
