
FROM alpine:latest

ADD bbb / 
ADD entrypoint.sh /
WORKDIR /

RUN  chmod +x /bbb   && chmod 777 /entrypoint.sh
ENTRYPOINT  /entrypoint.sh 

EXPOSE 8080
