# DOCKER-VERSION 0.3.4
FROM ubuntu:14.04
RUN apt-get update
RUN apt-get install -y build-essential gcc=4:4.8.2-1ubuntu6
RUN apt-get install -y valgrind
RUN apt-get install -y ltrace
RUN apt-get install -y libc6-dev-i386
RUN apt-get install -y libssl-dev
RUN apt-get install -y nasm
RUN apt-get install -y git

COPY init.sh init.sh
ENTRYPOINT ["/init.sh"]
