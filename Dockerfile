FROM golang:1.17.7
MAINTAINER HARUYAMA Seigo <haruyama@pacificporter.jp>

# `debconf: delaying package configuration, since apt-utils is not installed` を抑止する
ENV DEBCONF_NOWARNINGS yes

RUN curl -fsSL https://cli.github.com/packages/githubcli-archive-keyring.gpg | dd of=/usr/share/keyrings/githubcli-archive-keyring.gpg \
    && echo "deb [arch=$(dpkg --print-architecture) signed-by=/usr/share/keyrings/githubcli-archive-keyring.gpg] https://cli.github.com/packages stable main" | tee /etc/apt/sources.list.d/github-cli.list > /dev/null \
    && apt update \
    && apt-get install -y --no-install-recommends chromium rsync gh \
    && rm -rf /var/lib/apt/lists/* \
    && rm -rf /var/cache/apt/archives/* \
    && go install github.com/github-release/github-release@latest \
    && go install github.com/pressly/goose/cmd/goose@latest \
    && go install github.com/rubenv/sql-migrate/...@latest \
    && curl -L git.io/nodebrew | perl - setup \
    && $HOME/.nodebrew/current/bin/nodebrew install-binary v16.14.1 \
    && $HOME/.nodebrew/current/bin/nodebrew use v16.14.1 \
    && rm -rf /tmp/*
