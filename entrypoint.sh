#!/bin/sh

mkdir -p /var/run/tor
chown -R tor /var/run/tor
tor -f /etc/tor/torrc

i2pd --conf=/etc/i2pd/i2pd.conf --tunconf=/etc/i2pd/tunnels.conf --daemon

privoxy --no-daemon /etc/privoxy/config --user privoxy