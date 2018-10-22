FROM ubuntu:latest

LABEL author Carlin Scott <carlin.q.scott@gmail.com>

ENV DEBIAN_FRONTEND noninteractive
ENV DISPLAY=192.168.99.1:0.0

RUN useradd  -m firefox
USER firefox

RUN apt-get update
RUN apt-get install -y software-properties-common && \
    add-apt-repository ppa:ubuntu-mozilla-daily/ppa

RUN apt-get update && \
    apt-get install -y firefox-trunk
ENTRYPOINT [ "firefox-trunk" ]