FROM alpine:latest
MAINTAINER Jim Campbell <jwcampbell@gmail.com>

ENV VERSION v0.7.0

RUN apk add --no-cache bash && \
    apk add --no-cache curl && \
    mkdir -p /opt/zola-${VERSION} && \
    curl -L https://github.com/getzola/zola/releases/download/${VERSION}/zola-${VERSION}-x86_64-unknown-linux-gnu.tar.gz | tar xzv -C /opt/zola-${VERSION}

ENV PATH $PATH:/opt/zola-${VERSION}

EXPOSE 1111

CMD ["zola serve"]
