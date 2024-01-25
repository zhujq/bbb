FROM golang:alpine3.19 as builder

WORKDIR $GOPATH/src/bbb
COPY . .

RUN apk update && apk add --no-cache git build-base && set -x && \
    go mod init && go mod tidy
RUN CGO_ENABLED=0 GOOS=linux go build -a -installsuffix cgo  -o /bbb bbb.go


FROM alpine:latest

WORKDIR /
COPY --from=builder /bbb .

ADD entrypoint.sh /entrypoint.sh


RUN  chmod +x /bbb   && chmod 777 /entrypoint.sh
ENTRYPOINT  /entrypoint.sh

EXPOSE 8080
