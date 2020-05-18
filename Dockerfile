FROM golang:1.14.3
MAINTAINER HARUYAMA Seigo <haruyama@pacificporter.jp>

RUN apt-get update \
    && apt-get install -y --no-install-recommends chromium rsync \
    && rm -rf /var/lib/apt/lists/* \
    && rm -rf /var/cache/apt/archives/* \
    && go get github.com/kisielk/errcheck \
    && go get github.com/sigma/gocyclo \
    && go get golang.org/x/lint/golint \
    && go get github.com/haruyama/golintx/golintx \
    && go get bitbucket.org/liamstask/goose/cmd/goose \
    && go get honnef.co/go/tools/cmd/staticcheck \
    && go get github.com/mdempsky/unconvert \
    && go get github.com/gordonklaus/ineffassign \
    && go get github.com/rubenv/sql-migrate/... \
    && go get github.com/gostaticanalysis/nilerr/cmd/nilerr \
    && curl -L git.io/nodebrew | perl - setup \
    && $HOME/.nodebrew/current/bin/nodebrew install-binary v12.16.3 \
    && $HOME/.nodebrew/current/bin/nodebrew use v12.16.3 \
    && rm -rf /tmp/*
