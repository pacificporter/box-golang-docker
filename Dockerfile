FROM golang:1.5.3

RUN apt-get update \
    && apt-get install -y bzip2 libfreetype6 libfontconfig1 rsync libpng12-0 libicu52 \
    && curl http://ftp.jp.debian.org/debian/pool/main/libj/libjpeg8/libjpeg8_8d1-2_amd64.deb -o /tmp/libjpeg8_8d1-2_amd64.deb \
    && dpkg -i /tmp/libjpeg8_8d1-2_amd64.deb \
    && rm /tmp/libjpeg8_8d1-2_amd64.deb \
    && go get golang.org/x/tools/cmd/vet \
    && go get github.com/kisielk/errcheck \
    && curl -L git.io/nodebrew | perl - setup \
    && $HOME/.nodebrew/current/bin/nodebrew install-binary v4.3.0 \
    && $HOME/.nodebrew/current/bin/nodebrew use v4.3.0 \
    && $HOME/.nodebrew/current/bin/npm install gulp coffeelint -g
