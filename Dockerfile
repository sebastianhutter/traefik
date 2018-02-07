ARG VERSION=alpine

FROM traefik:${VERSION}

ARG TOML
# copy custom toml config
COPY toml/${TOML} /etc/traefik/traefik.toml

# copy custom entrypoint script
# original copied from repo:
# https://github.com/containous/traefik-library-image/blob/master/alpine/entrypoint.sh
ADD entrypoint.sh /entrypoint.sh
RUN chmod +x /entrypoint.sh