#!/bin/bash

command -v unzip >/dev/null 2>&1 || { sudo apt-get install -y unzip; }

echo "Extracting game launch splash screens"
unzip launching.zip -d /opt/retropie/configs
