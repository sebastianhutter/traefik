FROM traefik:alpine

# copy custom toml config
ARG TOML
COPY toml/${TOML} /etc/traefik/traefik.toml

# copy custom entrypoint script
# original copied from repo:
# https://github.com/containous/traefik-library-image/blob/master/alpine/entrypoint.sh
ADD entrypoint.sh /entrypoint.sh
RUN chmod +x /entrypoint.sh