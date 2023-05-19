#!/bin/sh
supervisord -c  /etc/supervisord.conf
PUID=${PUID:-6000}
PGID=${PGID:-6000}
groupmod -o -g "$PGID" abc
usermod -o -u "$PUID" abc
exec "$@"