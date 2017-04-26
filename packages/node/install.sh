#!/bin/bash

apt-get update && apt-get install -y $(cat depedences) && rm -rf /var/lib/apt/lists/*

curl -sL https://deb.nodesource.com/setup_6.x | bash -
apt-get install -y nodejs

npm install -g $(cat node-packages)