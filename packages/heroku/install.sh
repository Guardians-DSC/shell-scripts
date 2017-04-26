#!/bin/bash

apt-get update

sed -i -e 's/us.archive.ubuntu.com/archive.ubuntu.com/g' /etc/apt/sources.list

apt-get -y install curl

apt-get install apt-transport-https

curl -L https://cli-assets.heroku.com/apt/release.key | apt-key add -

apt-get -y install software-properties-common # debian only

add-apt-repository "deb https://cli-assets.heroku.com/branches/stable/apt ./"

apt-get update

apt-get -y install heroku
