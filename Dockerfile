FROM alpine:lastest

RUN apk add --update --no-cache \
    privoxy i2pd tor \
    ca-certificates

COPY --chown=privoxy:privoxy ./privoxy.conf /etc/privoxy/config
COPY --chown=i2pd:i2pd ./i2pd.conf /etc/i2pd/i2pd.conf
COPY --chown=tor:tor ./torrc.conf /etc/tor/torrc
COPY --chmod=755 ./entrypoint.sh /entrypoint.sh

ENTRYPOINT [ "/bin/sh", "/entrypoint.sh" ]