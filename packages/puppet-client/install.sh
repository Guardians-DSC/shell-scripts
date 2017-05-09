#!/bin/bash

wget https://apt.puppetlabs.com/puppetlabs-release-pc1-xenial.deb
yes | dpkg -i puppetlabs-release-pc1-xenial.deb
apt-get update && apt-get install -y puppet-agent

rm puppetlabs-release-pc1-xenial.deb
