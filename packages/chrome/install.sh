#!/bin/bash

sh -c 'echo "deb http://dl.google.com/linux/chrome/deb/ stable main" > /etc/apt/sources.list.d/google.list'
wget -q -O – https://dl-ssl.google.com/linux/linux_signing_key.pub | apt-key add -
yes | apt-get update
yes | apt-get -f install
yes | apt install google-chrome-stable
