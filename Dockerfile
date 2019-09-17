FROM node:10.16.3

LABEL author Carlin Scott <carlin.q.scott@gmail.com>

ENV DEBIAN_FRONTEND noninteractive

RUN useradd  -m firefox

# install Firefox dependencies
ADD debian-mozilla.list /etc/apt/sources.list.d/
RUN apt-get update
RUN apt-get install -y --no-install-recommends $(apt-cache depends firefox | grep Depends | sed "s/.*ends:\ //" | tr '\n' ' ')

# Install the appropriate Firefox build
RUN apt-get install -y --no-install-recommends firefox-esr

USER firefox
ENTRYPOINT [ "firefox" ]