FROM ubuntu:latest

LABEL author Carlin Scott <carlin.q.scott@gmail.com>

ENV DEBIAN_FRONTEND noninteractive

RUN useradd  -m firefox

RUN apt-get update
RUN apt-get install -y software-properties-common && \
    add-apt-repository ppa:ubuntu-mozilla-daily/ppa

RUN apt-get update && \
    apt-get install -y firefox-trunk
USER firefox
ENTRYPOINT [ "firefox-trunk" ]