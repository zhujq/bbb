
FROM alpine:latest
RUN apk add --no-cache bash
ADD . /
WORKDIR /

CMD ["/bin/bash", "entrypoint.sh"]

EXPOSE 8080
