FROM microsoft/dotnet:sdk

LABEL author Carlin Scott <carlin.q.scott@gmail.com>

ENV DEBIAN_FRONTEND noninteractive

RUN useradd  -m firefox

# install Firefox dependencies
ADD debian-mozilla.list /etc/apt/sources.list.d/
RUN wget mozilla.debian.net/pkg-mozilla-archive-keyring_1.1_all.deb && \
    dpkg -i pkg-mozilla-archive-keyring_1.1_all.deb && \
    rm pkg-mozilla-archive-keyring_1.1_all.deb
RUN apt-get update
RUN apt-get install -y --no-install-recommends $(apt-cache depends firefox | grep Depends | sed "s/.*ends:\ //" | tr '\n' ' ')

# Install the appropriate Firefox build
RUN apt-get install -y --no-install-recommends -t jessie-backports firefox

USER firefox
ENTRYPOINT [ "firefox" ]