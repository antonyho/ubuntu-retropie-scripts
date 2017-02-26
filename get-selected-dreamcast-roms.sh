#!/bin/bash
# My favourite Dreamcast selection
# Ikaruga

# https://archive.org/details/RedumpSegaDreamcast20160613
# http://redump.org/


if [ $# -lt 2 ]; then
	echo "This script requires archive.org username and password in order to start downloading."
	echo "Usage:"
	echo "./get-selected-ps-roms.sh <username> <password>"
else
	command -v unzip >/dev/null 2>&1 || { sudo apt-get install -y unzip; }
	command -v curl >/dev/null 2>&1 || { sudo apt-get install -y curl; }

	mkdir -p $HOME/RetroPieInstallation/dc
	cd $HOME/RetroPieInstallation/dc
	echo "Getting my selected Dreamcast games from redump ROM set"
	curl https://archive.org/account/login.php -c cookie.txt >/dev/null
	curl https://archive.org/account/login.php -b cookie.txt -c cookie.txt -F "username=$1" -F "password=$2" -F "referer=https://archive.org/" -F "action=login" -F "submit=Log in" >/dev/null
	curl https://archive.org/ -b cookie.txt -c cookie.txt >/dev/null

	curl https://archive.org/download/RedumpSegaDreamcast20160613/Ikaruga%20%28Japan%29.zip -L -b cookie.txt -c cookie.txt -o $HOME/RetroPieInstallation/dc/Ikaruga-Japan.zip

	if [ -f cookie.txt ]; then
		rm cookie.txt
	fi

	mkdir -p $HOME/RetroPie/roms/dc/Ikaruga-Japan/
	unzip $HOME/RetroPieInstallation/dc/Ikaruga-Japan.zip -d $HOME/RetroPie/roms/dreamcast/Ikaruga-Japan/
fi
