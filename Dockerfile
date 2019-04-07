FROM node:8.15-slim

MAINTAINER Jim Campbell <jwcampbell@gmail.com>

ENV VERSION v0.6.0

RUN apt update -y && apt install -y curl tar && \
    mkdir -p /opt/zola-${VERSION} && \
    curl -L https://github.com/getzola/zola/releases/download/${VERSION}/zola-${VERSION}-x86_64-unknown-linux-gnu.tar.gz | tar xzv -C /opt/zola-${VERSION}

ENV PATH $PATH:node_modules/.bin:/opt/zola-${VERSION}

CMD ["sh", "-c", "zola serve"]
