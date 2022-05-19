FROM registry.access.redhat.com/ubi8/go-toolset

RUN go install github.com/xo/usql@master

ENTRYPOINT ["/opt/app-root/src/go/bin/usql"]
CMD []
