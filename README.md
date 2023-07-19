# Hidden services proxy

This repository contains a docker image that creates a proxy based on [Privoxy](https://www.privoxy.org/) for accessing hidden services.

## Available services

- `*.onion` - [Tor](https://www.torproject.org/) hidden services, e.g. [DuckDuckGo](https://duckduckgogg42xjoc72x3sjasowoarfbgcmvfimaftt6twagswzczad.onion/).
- `*.i2p` - [I2P](https://geti2p.net/) eepsites, [Catalog](http://reg.i2p/)

## Installation

Run the following command, replace PORT with your desired port number and ARCH with your architecture (`amd64` or `arm64` or `386`).

```bash
sudo docker run -d -p PORT:8118 --restart=unless-stopped --name=hsproxy ghcr.io/c10udburst/hsproxy:ARCH
```

## Usage

To use the proxy, configure your browser to use the **http** proxy at `server:PORT`.

You can see guides for configuring the proxy [here](https://www.privoxy.org/user-manual/startup.html).

After configuring the proxy, you can check if it works by visiting [config.privoxy.org/show-status](http://config.privoxy.org/show-status), which should show the Privoxy status page. 

After all that, `.i2p` and `.onion` sites should work (as well as regular websites of course).

## Notes

- Https may not work for `.onion` or `.i2p` sites, as they may not have valid certificates.
- The proxy does not route clearnet traffic through Tor, only `.onion` domains.
- The proxy is inherently less secure than Tor Browser, as it does not have the same protections against fingerprinting.
- Javascript is disabled for `.onion` and `.i2p` sites, for privacy and security reasons.
