#!/bin/bash
# Get no-intro FDS(Famicom Disk System) ROM set
# https://archive.org/details/No-Intro-Collection_2016-01-03_Fixed

if [ $# -lt 2 ]; then
	echo "This script requires archive.org username and password in order to start downloading."
	echo "Usage:"
	echo "./get-fds-rom-set.sh <username> <password>"
else
	sudo apt-get install -y unzip curl
	mkdir -p $HOME/RetroPieInstallation
	cd $HOME/RetroPieInstallation
	echo "Getting FDS no-intro ROM set"
	curl https://archive.org/account/login.php -c cookie.txt
	curl https://archive.org/account/login.php -b cookie.txt -c cookie.txt -F "username=$1" -F "password=$2" -F "referer=https://archive.org/" -F "action=login" -F "submit=Log in"
	curl https://archive.org/ -b cookie.txt -c cookie.txt
	curl https://archive.org/download/No-Intro-Collection_2016-01-03_Fixed/Nintendo%20-%20Famicom%20Disk%20System.zip -L -b cookie.txt -c cookie.txt -o $HOME/RetroPieInstallation/no-intro-FDS-rom-set.zip
	
	if [ -f cookie.txt ]; then
		rm cookie.txt
	fi

	unzip $HOME/RetroPieInstallation/no-intro-FDS-rom-set.zip -d $HOME/RetroPie/roms/fds/
fi
