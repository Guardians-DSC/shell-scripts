#!/bin/bash

# Install add-apt-repository
apt-get update && apt-get install -y software-properties-common
add-apt-repository ppa:webupd8team/brackets

apt-get update && apt-get install -y brackets
