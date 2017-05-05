#!/bin/bash

# Codecs e outros pacotes extras
apt-get install -y ubuntu-restricted-extras ubuntu-restricted-addons

echo "deb http://archive.canonical.com/ubuntu yakkety partner" >> /etc/apt/sources.list

# Flash
add-apt-repository ppa:nilarimogard/webupd8
apt-get update &&  apt-get install -y \
  adobe-flashplugin \
  vlc \
  browser-plugin-vlc \
  mplayer
