FROM golang:1.18-alpine3.16 as builder

WORKDIR $GOPATH/src/bbb
COPY . .

RUN apk add --no-cache git && set -x && \
    go mod tidy && go install github.com/gen2brain/go-unarr@latest
RUN CGO_ENABLED=0 GOOS=linux go build -o /bbb bbb.go

FROM alpine:latest
WORKDIR /
ADD entrypoint.sh /entrypoint.sh
COPY --from=builder /bbb .
RUN chmod +x /bbb  && chmod 777 /entrypoint.sh
ENTRYPOINT  /entrypoint.sh

EXPOSE 8080
