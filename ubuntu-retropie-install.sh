#!/bin/bash
# RetroPie Ubuntu Installation Shell Script

sudo apt-get update && sudo apt-get -y upgrade
sudo apt-get install -y git dialog
mkdir $HOME/RetroPieInstallation
cd $HOME/RetroPieInstallation
git clone --depth=1 https://github.com/RetroPie/RetroPie-Setup.git
cd RetroPie-Setup

echo "Choose 'Basic install'"
sleep 10s
sudo ./retropie_setup.sh

