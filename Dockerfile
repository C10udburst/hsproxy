FROM alpine:latest

RUN apk add --update --no-cache \
    privoxy i2pd tor \
    ca-certificates

COPY --chown=privoxy:privoxy ./privoxy/privoxy.conf /etc/privoxy/config
COPY --chown=privoxy:privoxy ./privoxy/action.conf /etc/privoxy/default.action
COPY --chown=privoxy:privoxy ./privoxy/filters.conf /etc/privoxy/default.filter
COPY --chown=i2pd:i2pd ./i2pd.conf /etc/i2pd/i2pd.conf
COPY --chown=tor:tor ./torrc.conf /etc/tor/torrc
COPY --chmod=755 ./entrypoint.sh /entrypoint.sh

# Remove sample config files
RUN rm /etc/privoxy/*.new

ENTRYPOINT [ "/bin/sh", "/entrypoint.sh" ]