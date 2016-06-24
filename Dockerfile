FROM golang:1.6.2

RUN apt-get update \
    && apt-get install -y bzip2 libfreetype6 libfontconfig1 rsync libpng12-0 libicu52 \
    && curl http://ftp.jp.debian.org/debian/pool/main/libj/libjpeg8/libjpeg8_8d1-2_amd64.deb -o /tmp/libjpeg8_8d1-2_amd64.deb \
    && dpkg -i /tmp/libjpeg8_8d1-2_amd64.deb \
    && rm /tmp/libjpeg8_8d1-2_amd64.deb \
    && rm -rf /var/lib/apt/lists/* \
    && rm -rf /var/cache/apt/archives/* \
    && go get github.com/kisielk/errcheck \
    && go get github.com/sigma/gocyclo \
    && go get github.com/Masterminds/glide \
    && go get github.com/golang/lint/golint \
    && go get github.com/haruyama/golintx/golintx \
    && go get bitbucket.org/liamstask/goose/cmd/goose \
    && go get honnef.co/go/simple/cmd/gosimple \
    && go get github.com/mdempsky/unconvert \
    && curl -L git.io/nodebrew | perl - setup \
    && $HOME/.nodebrew/current/bin/nodebrew install-binary v4.4.6 \
    && $HOME/.nodebrew/current/bin/nodebrew use v4.4.6 \
    && $HOME/.nodebrew/current/bin/npm install gulp coffeelint -g \
    && rm -rf /tmp/*
