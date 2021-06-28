FROM golang:1.16.4
MAINTAINER HARUYAMA Seigo <haruyama@pacificporter.jp>

RUN apt-get update \
    && apt-get install -y --no-install-recommends chromium rsync \
    && rm -rf /var/lib/apt/lists/* \
    && rm -rf /var/cache/apt/archives/* \
    && go get github.com/github-release/github-release \
    && go get github.com/pressly/goose/cmd/goose \
    && go get github.com/rubenv/sql-migrate/... \
    && curl -L git.io/nodebrew | perl - setup \
    && $HOME/.nodebrew/current/bin/nodebrew install-binary v14.15.4 \
    && $HOME/.nodebrew/current/bin/nodebrew use v14.15.4 \
    && rm -rf /tmp/*
