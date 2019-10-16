FROM alpine:latest

RUN apk --no-cache --no-progress upgrade && \
    apk --no-cache --no-progress add \
        bash \
        curl \
        ip6tables \
        iptables \
        openvpn \
        shadow \
        tini && \
    addgroup -S vpn && \
    rm -rf /tmp/*
