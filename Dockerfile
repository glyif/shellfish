# DOCKER-VERSION 0.3.4
FROM ubuntu:14.04

RUN apt-get update
RUN apt-get -y install git gcc ltrace

COPY init.sh init.sh
ENTRYPOINT ["/init.sh"]
