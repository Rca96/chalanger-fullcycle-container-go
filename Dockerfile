FROM golang:latest AS builder

WORKDIR /go/src/app

RUN go mod init example/hello

COPY hello.go .

RUN go build -o hello .

FROM scratch

COPY --from=builder /go/src/app/hello /

CMD ["/hello"]
