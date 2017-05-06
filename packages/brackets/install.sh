#!/bin/bash

wget https://github.com/adobe/brackets/releases/download/release-1.9/Brackets.Release.1.9.64-bit.deb --output-document=brackets.deb
yes | dpkg -i brackets.deb
rm brackets.deb
