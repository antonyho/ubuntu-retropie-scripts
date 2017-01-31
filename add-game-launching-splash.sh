#!/bin/bash
# Show a default splash screen when no game art is available in gamelist.xml
# https://retropie.org.uk/forum/topic/4611/runcommand-system-splashscreens/2

command -v unzip >/dev/null 2>&1 || { sudo apt-get install -y unzip; }

echo "Extracting game launch splash screens"
unzip launching.zip -d /opt/retropie/configs
