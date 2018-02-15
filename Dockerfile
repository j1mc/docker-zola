FROM node:8.8-slim

MAINTAINER Jim Campbell <jwcampbell@gmail.com>

ENV VERSION v0.3.1

RUN apt update -y && apt install -y wget tar && \
    wget https://github.com/Keats/gutenberg/releases/download/${VERSION}/gutenberg-${VERSION}-x86_64-unknown-linux-gnu.tar.gz -O gutenberg.tar.gz && \
    mkdir -p /opt/gutenberg-${VERSION} && \
    tar -xzf gutenberg.tar.gz -C /opt/gutenberg-${VERSION}/ && \
    rm gutenberg.tar.gz

ENV PATH $PATH:node_modules/.bin:/opt/gutenberg-${VERSION}

CMD ["sh", "-c", "gutenberg serve"]
