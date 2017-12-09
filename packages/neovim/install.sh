#!/bin/bash

# Install add-apt-repository
apt-get update && apt-get install -y software-properties-common
add-apt-repository ppa:neovim-ppa/stable

apt-get update && apt-get -y install neovim
