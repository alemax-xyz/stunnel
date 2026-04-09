## Stunnel docker image

[Stunnel](https://www.stunnel.org) is a proxy designed to add TLS encryption functionality to existing clients and servers without any changes in the programs' code.
Its architecture is optimized for security, portability, and scalability (including load-balancing), making it suitable for large deployments.

This image is based on official [stunnel](https://www.stunnel.org) builds for debian and it is built on top of the [clover/common](https://hub.docker.com/r/clover/common/).

### Enviroment variables

| Name | Default value | Description
| ---- | ------------- | -----------
| `PUID` | `50` | Desired _UID_ of the process owner _*_
| `PGID` | primary group id of the _UID_ user (`50`) | Desired _GID_ of the process owner _*_
| `CRON` | _not set_ | Will start _cron_ inside the container if set to `1`
| `TIMEZONE` | `UTC` | Desired container timezone

### Configuration files

| Location | Description
| -------- | -----------
| `/etc/stunnel/stunnel.conf` | Main stunnel configuration file
| `/etc/stunnel/conf.d/` | Extra stunnel configuration files for the services

### Supported platforms

 * `linux/amd64`;
 * `linux/386`;
 * `linux/arm/v7`;
 * `linux/arm64/v8`;
 * `linux/ppc64le`;
 * `linux/s390x`;
