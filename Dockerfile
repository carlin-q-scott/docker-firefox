FROM ubuntu:latest

LABEL author Carlin Scott <carlin.q.scott@gmail.com>

ENV DEBIAN_FRONTEND noninteractive

RUN useradd  -m firefox

# install Firefox dependencies
RUN apt-get update
RUN apt-get install -y --no-install-recommends $(apt-cache depends firefox | grep Depends | sed "s/.*ends:\ //" | tr '\n' ' ')

# Install the appropriate Firefox build
RUN apt-get install -y software-properties-common && \
    add-apt-repository ppa:ubuntu-mozilla-daily/ppa && \
    apt-get update
RUN apt-get install -y --no-install-recommends firefox-trunk

USER firefox
ENTRYPOINT [ "firefox-trunk" ]