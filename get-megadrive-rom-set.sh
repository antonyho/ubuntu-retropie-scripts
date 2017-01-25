#!/bin/bash
# Get no-intro SEGA Mega Drive - Genesis ROM set

sudo apt-get install -y unzip curl
mkdir -p $HOME/RetroPieInstallation
cd $HOME/RetroPieInstallation
echo "Getting SEGA Mega Drive ROM set"
curl https://archive.org/download/No-Intro-Collection_2016-01-03_Fixed/Sega%20-%20Mega%20Drive%20-%20Genesis.zip -o no-intro-Sega-MegaDrive-Genesis.zip

unzip $HOME/RetroPieInstallation/no-intro-Sega-MegaDrive-Genesis.zip -d $HOME/RetroPie/roms/megadrive