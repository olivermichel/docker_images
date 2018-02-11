FROM alpine:3.7

RUN apk add --no-cache openvpn \
  && mkdir -p /root/config

ADD run.sh /root/run.sh
RUN chmod a+x /root/run.sh
VOLUME /root/config
ENTRYPOINT /root/run.sh
