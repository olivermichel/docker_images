FROM alpine:3.7

MAINTAINER Oliver Michel <oliver.michel@editum.de>

ARG MAKEFLAGS
ENV MAKEFLAGS ${MAKEFLAGS:--j4}
ENV PROTOBUF_VERSION 3.5.1
ENV GRPC_VERSION 1.8.5

RUN apk --no-cache add alpine-sdk autoconf automake coreutils file libtool \
  && mkdir /opt

RUN  git clone -b v$PROTOBUF_VERSION https://github.com/google/protobuf.git /opt/protobuf \
  && cd /opt/protobuf \
  && git submodule update --init \
  && ./autogen.sh \
  && ./configure \
  && make \
  && make install

RUN git clone -b v$GRPC_VERSION https://github.com/grpc/grpc.git /opt/grpc \
  && cd /opt/grpc \
  && git submodule update --init \
  && make \
  && make install
