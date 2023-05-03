FROM golang:1.20.4

# `debconf: delaying package configuration, since apt-utils is not installed` を抑止する
ENV DEBCONF_NOWARNINGS yes

RUN apt-get update \
    && apt-get install -y --no-install-recommends chromium rsync unzip patch jq \
    && rm -rf /var/lib/apt/lists/* \
    && rm -rf /var/cache/apt/archives/* \
    && go install github.com/pressly/goose/v3/cmd/goose@latest \
    && go install github.com/mackee/git-credential-github-apps@latest \
    && curl -L git.io/nodebrew | perl - setup \
    && $HOME/.nodebrew/current/bin/nodebrew install-binary v14.21.3 \
    && $HOME/.nodebrew/current/bin/nodebrew use v14.21.3 \
    && rm -rf /tmp/* \
    && curl "https://awscli.amazonaws.com/awscli-exe-linux-x86_64.zip" -o "awscliv2.zip" \
    && unzip awscliv2.zip \
    && ./aws/install \
    && rm -rf ./awscliv2.zip ./aws
