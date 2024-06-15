FROM alpine AS downloader
ARG TAG
ARG TARGETARCH

RUN apk add --no-cache curl bzip2 \
    && export VERSION=$(echo ${TAG} | sed 's/^v//') \
    && echo "url: https://github.com/xo/usql/releases/download/${TAG}/usql_static-${VERSION}-linux-${TARGETARCH}.tar.bz2" \
    && curl --fail -sSL -o /tmp/binary.tar.bz2 https://github.com/xo/usql/releases/download/${TAG}/usql_static-${VERSION}-linux-${TARGETARCH}.tar.bz2 \
    && mkdir -p /usr/local/bin \
    && tar -xjf /tmp/binary.tar.bz2 -C /usr/local/bin

FROM alpine
COPY --from=downloader /usr/local/bin/usql_static /usr/local/bin/usql
ENTRYPOINT ["/usr/local/bin/usql"]
CMD ["--help"]
