#! /bin/bash

codename=$(lsb_release -cs)

echo "deb http://deb.debian.org/debian $codename-backports main contrib non-free"| tee -a /etc/apt/sources.list && apt update
apt install linux-headers-amd64
apt install -t bullseye-backports zfsutils-linux
