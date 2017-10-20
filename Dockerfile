FROM alpine:edge

MAINTAINER Nikolauska <nikolauska1@gmail.com>

ENV VERSION v0.2.1

RUN apk -U upgrade && apk --update --no-cache add wget nodejs && \
    wget https://github.com/Keats/gutenberg/releases/download/${VERSION}/gutenberg-${VERSION}-x86_64-unknown-linux-gnu.tar.gz -O gutenberg.tar.gz && \
    tar -xvf gutenberg.tar.gz /usr/bin/ && \
    rm gutenberg.tar.gz && \
    rm -rf /var/cache/apk/*

ENV PATH $PATH:node_modules/.bin

CMD ["sh", "-c", "gutenberg", "serve"]
