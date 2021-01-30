# lan-play-docker

A dockerized lan-play client which allows you to play LAN-enabled Nintendo Switch games over WAN.

## Getting Started

These instructions will enable you to run this docker container on a host on your network. The address to connect to is configurable via environment variable to make switching servers easier.

### Prerequisites

You will need the following:

* A machine on your network running Docker ([Windows, MacOS](https://www.docker.com/products/docker-desktop) or Linux)
* A server to connect to (Seee [lan-play](https://www.lan-play.com/) or [host your own](https://github.com/spacemeowx2/switch-lan-play))
* A Nintendo Switch [configured for lan-play](https://www.lan-play.com/install)
* (Optional) [ldn_mitm](https://github.com/spacemeowx2/ldn_mitm) if you wish to play Local Wireless games over LAN instead e.g. Animal Crossing

### Build the image

```
git clone https://github.com/treyturner/lan-play-docker.git
cd lan-play-docker
docker build . -t treyturner/lan-play-docker
```

### docker-compose

This docker-compose happens to work for me to run both the client and the server; YMMV.

```
version: "2"

services:
  server:
    container_name: switchlanplay_server
    image: spacemeowx2/switch-lan-play
    restart: unless-stopped
    ports:
      - 11451:11451/udp
      - 11451:11451/tcp

  client:
    container_name: switchlanplay_client
    image: treyturner/lan-play-docker
    restart: unless-stopped
    network_mode: host
    depends_on:
      - server
    environment:
      - SWITCH_LAN_PLAY_SERVER=docker:11451  # update to your docker host's hostname or IP
```

## Acknowledgments

* [spacemeowx2](https://github.com/spacemeowx2/switch-lan-play) for writing lan-play-linux
* [chrispy212](https://github.com/chrispy212/) for creating the initial Dockerfile
