#!/bin/bash

wget https://download.docker.com/linux/ubuntu/dists/xenial/pool/stable/amd64/docker-ce_17.03.0~ce-0~ubuntu-xenial_amd64.deb

yes | apt-get update
yes | apt-get -f install
yes | dpkg -i docker-ce_17.03.0~ce-0~ubuntu-xenial_amd64.deb

rm docker-ce_17.03.0~ce-0~ubuntu-xenial_amd64.deb
