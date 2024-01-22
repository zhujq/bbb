
FROM alpine:latest

ADD . /
WORKDIR /

CMD ["/bin/bash", "entrypoint.sh"]

EXPOSE 8080
