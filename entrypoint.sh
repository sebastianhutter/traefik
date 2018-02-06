#!/bin/sh
set -e

# export docker secrets if available
# route53 entries
[ -f "run/secrets/aws-key" ] && export AWS_ACCESS_KEY_ID=$(cat /run/secrets/aws-key)
[ -f "run/secrets/aws-secret" ] && export AWS_SECRET_ACCESS_KEY=$(cat /run/secrets/aws-secret)

# create the acme.json file with the correct permisisons
[ -f "/acme/acme.json" ] || touch /acme/acme.json
chmod 600 /acme/acme.json

# first arg is `-f` or `--some-option`
if [ "${1#-}" != "$1" ]; then
    set -- traefik "$@"
fi

# if our command is a valid Traefik subcommand, let's invoke it through Traefik instead
# (this allows for "docker run traefik version", etc)
if traefik "$1" --help 2>&1 >/dev/null | grep "help requested" > /dev/null 2>&1; then
    set -- traefik "$@"
fi

exec "$@"