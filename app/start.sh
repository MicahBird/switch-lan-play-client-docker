#! /usr/bin/env bash

echo Running with server $SWITCH_LAN_PLAY_SERVER
cd /app
./lan-play-linux --relay-server-addr $SWITCH_LAN_PLAY_SERVER
