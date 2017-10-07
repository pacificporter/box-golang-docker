FROM golang:1.9.1
MAINTAINER HARUYAMA Seigo <haruyama@pacificporter.jp>

RUN apt-get update \
    && apt-get install -y --no-install-recommends chromium rsync \
    && rm -rf /var/lib/apt/lists/* \
    && rm -rf /var/cache/apt/archives/* \
    && go get github.com/kisielk/errcheck \
    && go get github.com/sigma/gocyclo \
    && go get github.com/Masterminds/glide \
    && go get github.com/golang/lint/golint \
    && go get github.com/haruyama/golintx/golintx \
    && go get bitbucket.org/liamstask/goose/cmd/goose \
    && go get honnef.co/go/tools/cmd/gosimple \
    && go get github.com/mdempsky/unconvert \
    && go get github.com/rubenv/sql-migrate/... \
    && curl -L git.io/nodebrew | perl - setup \
    && $HOME/.nodebrew/current/bin/nodebrew install-binary v6.11.1 \
    && $HOME/.nodebrew/current/bin/nodebrew use v6.11.1 \
    && export PATH=$PATH:$HOME/.nodebrew/current/bin \
    && $HOME/.nodebrew/current/bin/npm install gulp coffeelint eslint eslint-plugin-react -g \
    && rm -rf /tmp/*
