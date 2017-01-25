#!/bin/bash
# Get no-intro SNES ROM set

sudo apt-get install -y unzip curl
mkdir -p $HOME/RetroPieInstallation
cd $HOME/RetroPieInstallation
echo "Getting SNES no-intro ROM set"
curl https://archive.org/download/No-Intro-Collection_2016-01-03_Fixed/Nintendo%20-%20Super%20Nintendo%20Entertainment%20System.zip -C -o no-intro-SNES-rom-set.zip

unzip no-intro-SNES-rom-set.zip -d $HOME/RetroPie/roms
