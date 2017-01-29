#!/bin/bash
# Get no-intro SNES ROM set

if [ $# -lt 2 ]; then
	echo "This script requires archive.org username and password in order to start downloading."
	echo "Usage:"
	echo "./get-snes-rom-set.sh <username> <password>"
else
	sudo apt-get install -y unzip curl
	mkdir -p $HOME/RetroPieInstallation
	cd $HOME/RetroPieInstallation
	echo "Getting SNES no-intro ROM set"
	curl -c -d "user=$1" -d "password=$2" -d "referer=https://archive.org/" -d "action=login" https://archive.org/account/login.php
	curl -c https://archive.org/download/No-Intro-Collection_2016-01-03_Fixed/Nintendo%20-%20Super%20Nintendo%20Entertainment%20System.zip -o no-intro-SNES-rom-set.zip

	unzip $HOME/RetroPieInstallation/no-intro-SNES-rom-set.zip -d $HOME/RetroPie/roms
fi