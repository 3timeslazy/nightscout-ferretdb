FROM ghcr.io/ferretdb/ferretdb:1.21.0 as ferretdb
FROM nightscout/cgm-remote-monitor as nightscout

FROM node:16.16.0-alpine

WORKDIR /nightscout-ferretdb

COPY --from=ferretdb /ferretdb ./ferretdb
COPY --from=nightscout /opt/app ./nightscout

COPY resources/services.d /etc/services.d

ADD https://github.com/just-containers/s6-overlay/releases/download/v1.22.1.0/s6-overlay-amd64.tar.gz /tmp/
RUN tar xzf /tmp/s6-overlay-amd64.tar.gz -C /

EXPOSE 1337

ENTRYPOINT ["/init"]
