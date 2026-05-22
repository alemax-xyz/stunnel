FROM library/debian:stable-slim AS build

ENV LANG=C.UTF-8 \
    SANDBOX_ROOT=/

RUN export DEBIAN_FRONTEND=noninteractive \
 && apt-get update \
 && apt-get install -y wget openssl ca-certificates

ADD https://github.com/alemax-xyz/misc-tools.git#main /usr/local/bin/

RUN mkdir -p /build /rootfs

WORKDIR /build

COPY build/ .

COPY --from=clover/common:latest /var/lib/packages/ var/lib/packages/

RUN apt-sandbox --install --verstamp \
        --apt-config \
            APT::Install-Recommends=false \
            APT::Get::Upgrade==false \
        --repository . \
        --keyring . \
        --installed var/lib/packages \
        --obsolete packages.obsolete \
        --required packages.required

WORKDIR /rootfs

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

COPY rootfs/ .

FROM clover/common

ENV LANG=C.UTF-8 \
    STUNNEL_ARGS="/etc/stunnel/stunnel.conf"

WORKDIR /
COPY --from=build /rootfs /
