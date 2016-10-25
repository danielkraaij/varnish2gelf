FROM        phusion/baseimage:0.9.19
MAINTAINER  Daniel Kraaij <daniel@daank.com>

ENV         DEBIAN_FRONTEND=noninteractive

ADD         root/ /

RUN         apt-get -q update --fix-missing && \
                apt-get -q install --assume-yes --no-install-recommends git-core build-essential checkinstall libz-dev varnish && \
                mkdir src && \
                cd /src && \
                git clone https://github.com/gboddin/json2gelf.git && \
                cd /src/json2gelf && \
                make clean && \
                make && \
                cp /src/json2gelf/json2gelf /usr/bin/json2gelf && \
                apt-get -q remove --assume-yes git git-core git-man liberror-perl build-essential checkinstall g++ g++-4.8 && \
                apt-get clean && \
                rm -r /var/lib/apt/lists/* && \
                for i in /etc/service/*/*; do echo $i; chmod +x $i; done

WORKDIR     /