FROM node:8.8-slim

MAINTAINER Jim Campbell <jwcampbell@gmail.com>

ENV VERSION v0.6.0

RUN apt update -y && apt install -y wget tar && \
    wget https://github.com/getzola/zola/releases/download/${VERSION}/zola-${VERSION}-x86_64-unknown-linux-gnu.tar.gz -O zola.tar.gz && \
    mkdir -p /opt/zola-${VERSION} && \
    tar -xzf zola.tar.gz -C /opt/zola-${VERSION}/ && \
    rm zola.tar.gz

ENV PATH $PATH:node_modules/.bin:/opt/zola-${VERSION}

CMD ["sh", "-c", "zola serve"]
