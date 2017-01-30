#!/bin/bash
# Get SEGA Saturn Drive ROM set
# https://archive.org/details/SgaStrnCmplt
# http://www.pleasuredome.org.uk/

if [ $# -lt 2 ]; then
	echo "This script requires archive.org username and password in order to start downloading."
	echo "Usage:"
	echo "./get-segasaturn-rom-set.sh <username> <password>"
else
	sudo apt-get install -y unzip curl
	mkdir -p $HOME/RetroPieInstallation
	cd $HOME/RetroPieInstallation
	echo "Getting SEGA Saturn ROM set"
	curl https://archive.org/account/login.php -c cookie.txt
	curl https://archive.org/account/login.php -b cookie.txt -c cookie.txt -F "username=$1" -F "password=$2" -F "referer=https://archive.org/" -F "action=login" -F "submit=Log in"
	curl https://archive.org/ -b cookie.txt -c cookie.txt
	curl https://archive.org/compress/SgaStrnCmplt -L -b cookie.txt -c cookie.txt -o $HOME/RetroPieInstallation/Sega-Saturn.zip
	
	if [ -f cookie.txt ]; then
		rm cookie.txt
	fi
	
	unzip $HOME/RetroPieInstallation/Sega-Saturn.zip -d $HOME/RetroPie/roms/saturn
fi
