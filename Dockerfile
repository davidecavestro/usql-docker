FROM golang:alpine as builder
RUN apk add git gcc musl-dev
RUN git clone --depth 1 https://github.com/xo/usql.git /build
WORKDIR /build
RUN go build

FROM alpine
COPY --from=builder /build/usql /usr/local/bin

ENTRYPOINT ["/usr/local/bin/usql"]
CMD ["--help"]
