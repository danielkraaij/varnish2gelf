FROM        phusion/baseimage:0.9.18
MAINTAINER  Daniel Kraaij <daniel@daank.com>

ENV         DEBIAN_FRONTEND=noninteractive

ADD         src/ /src

WORKDIR     /src/json2gelf
RUN         apt-get -q update --fix-missing && \
                apt-get -q install --assume-yes build-essential checkinstall libz-dev && \
                make clean && \
                make && \
                apt-get clean