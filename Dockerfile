# DOCKER-VERSION 0.3.4
FROM ubuntu:14.04
RUN apt-get update
RUN apt-get install -y build-essential gcc
RUN apt-get install -y valgrind
RUN apt-get install -y ltrace
RUN apt-get install -y libc6-dev-i386
RUN apt-get install -y libssl-dev
RUN apt-get install -y nasm

COPY init.sh init.sh
ENTRYPOINT ["/init.sh"]
