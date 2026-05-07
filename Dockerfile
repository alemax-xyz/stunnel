FROM library/debian:stable-slim AS build

ENV LANG=C.UTF-8

RUN export DEBIAN_FRONTEND=noninteractive \
 && apt-get update

RUN mkdir -p /build/image
WORKDIR /build

RUN apt-get download \
        libwrap0 \
        libgcrypt20 \
        liblzma5 \
        liblz4-1 \
        libnsl2 \
        libgpg-error0 \
        libtirpc3t64 \
        libgssapi-krb5-2 \
        libkrb5-3 \
        libk5crypto3 \
        libcom-err2 \
        libkrb5support0 \
        libkeyutils1 \
        stunnel4

RUN for file in *.deb; do dpkg-deb -x ${file} image/; done

WORKDIR /build/image
RUN mkdir -p etc/stunnel/conf.d \
 && rm -rf \
        etc/default \
        etc/init.d \
        etc/logrotate.d \
        etc/ppp \
        etc/stunnel/README \
        usr/bin/stunnel3 \
        usr/lib/systemd \
        usr/lib/sysusers.d \
        usr/lib/tmpfiles.d \
        usr/share

COPY etc/ etc/

FROM clover/common

ENV STUNNEL_ARGS="/etc/stunnel/stunnel.conf"

WORKDIR /
COPY --from=build /build/image /
