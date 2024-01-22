FROM alpine:latest
ADD entrypoint.sh /entrypoint.sh
ADD bbb /bbb
RUN chmod +x /bbb  && chmod 777 /entrypoint.sh
ENTRYPOINT  /entrypoint.sh

EXPOSE 8080
