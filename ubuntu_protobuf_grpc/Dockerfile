
FROM ubuntu:16.04

MAINTAINER Oliver Michel <oliver.michel@editum.de>

ARG MAKEFLAGS
ENV MAKEFLAGS ${MAKEFLAGS:--j4}
ENV PROTOBUF_VERSION 3.5.1
ENV GRPC_VERSION 1.8.5

RUN mkdir -p /root/opt /root/src \
    && apt-get update -q \
    && apt-get install -y --no-install-recommends build-essential software-properties-common \
    && add-apt-repository ppa:ubuntu-toolchain-r/test \
    && apt-get update -q \
    && apt-get install --no-install-recommends -qy g++-6 autoconf automake libtool curl cmake git \
        libboost-dev libbz2-dev libpcap-dev unzip bash ca-certificates \
    && update-alternatives --install /usr/bin/gcc gcc /usr/bin/gcc-6 60 --slave /usr/bin/g++ \
        g++ /usr/bin/g++-6

RUN cd /root \
    && git clone https://github.com/olivermichel/dotfiles.git .dotfiles \
    && echo ". ~/.dotfiles/sh/common.sh\n \
              . ~/.dotfiles/sh/linux.sh\n  \
              . ~/.dotfiles/sh/bash/config.bash\n \
              . ~/.dotfiles/sh/bash/prompt-min.bash" > .bashrc

RUN cd /root/opt \
    && git clone -b v$PROTOBUF_VERSION https://github.com/google/protobuf.git \
    && cd protobuf \
    && git submodule update --init \
    && ./autogen.sh \
    && ./configure \
    && make \
    && make install \
    && ldconfig

RUN cd /root/opt \
    && git clone -b v$GRPC_VERSION https://github.com/grpc/grpc.git \
    && cd grpc \
    && git submodule update --init \
    && make \
    && make install \
    && ldconfig
