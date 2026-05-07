## Stunnel docker image

[Stunnel](https://www.stunnel.org) is a proxy designed to add TLS encryption functionality to existing clients and servers without any changes in the programs' code.
Its architecture is optimized for security, portability, and scalability (including load-balancing), making it suitable for large deployments.

This image is based on official [stunnel](https://www.stunnel.org) builds for debian and it is built on top of the [clover/common](https://hub.docker.com/r/clover/common/).

### Enviroment variables


### Enviroment variables

| Name | Default value | Description
| ---- | ------------- | -----------
| `PUID` | _not set_ | desired user id of the process owner
| `PGID` | _not set_ | desired group id of the process pwner (primary group of the `PUID` user)
| `PUSER` | _not set_ | desired `PUID` user name
| `PGROUP` | _not set_ | desired `PGID` group name
| `CHOWN` | _not set_ | space-separated list of directories to change ownership to `PUID`/`PGID` during container startup
| `CRON` | _not set_ (`0`) | will start _cron_ inside the container if set to `1`
| `TZ` / `TIMEZONE` | _not set_ (`UTC`) | desired container timezone
| `STUNNEL_ARGS` | `/etc/stunnel/stunnel.conf` | arbitrary arguments to pass to `stunnel`

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
