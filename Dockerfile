
FROM alpine:latest

WORKDIR /
ADD . . 

RUN  chmod +x /bbb   && chmod 777 /entrypoint.sh
ENTRYPOINT  /entrypoint.sh 

EXPOSE 8080
