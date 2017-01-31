#!/bin/bash
# My favourite Playstation selection
# Castlevania - Symphony of the Night
# Final Fantasy VII

# https://archive.org/details/psx_redump_usa_20141221
# http://redump.org/

if [ $# -lt 2 ]; then
	echo "This script requires archive.org username and password in order to start downloading."
	echo "Usage:"
	echo "./get-selected-ps-roms.sh <username> <password>"
else
	command -v 7z >/dev/null 2>&1 || { sudo apt-get install -y p7zip-full; }
	command -v curl >/dev/null 2>&1 || { sudo apt-get install -y curl; }

	mkdir -p $HOME/RetroPieInstallation/ps
	cd $HOME/RetroPieInstallation/ps
	echo "Getting my selected Playstation games from redump ROM set"
	curl https://archive.org/account/login.php -c cookie.txt >/dev/null
	curl https://archive.org/account/login.php -b cookie.txt -c cookie.txt -F "username=$1" -F "password=$2" -F "referer=https://archive.org/" -F "action=login" -F "submit=Log in" >/dev/null
	curl https://archive.org/ -b cookie.txt -c cookie.txt >/dev/null

	curl https://archive.org/download/psx_redump_usa_20141221/Castlevania%20-%20Symphony%20of%20the%20Night%20%28USA%29.7z -L -b cookie.txt -c cookie.txt -o $HOME/RetroPieInstallation/ps/Castlevania-SymphonyoftheNightUSA.7z
	curl https://archive.org/download/psx_redump_usa_20141221/Final%20Fantasy%20VII%20%28USA%29%20%28Disc%201%29.7z -L -b cookie.txt -c cookie.txt -o $HOME/RetroPieInstallation/ps/FinalFantasyVIIUSADisc1.7z
	curl https://archive.org/download/psx_redump_usa_20141221/Final%20Fantasy%20VII%20%28USA%29%20%28Disc%202%29.7z -L -b cookie.txt -c cookie.txt -o $HOME/RetroPieInstallation/ps/FinalFantasyVIIUSADisc2.7z
	curl https://archive.org/download/psx_redump_usa_20141221/Final%20Fantasy%20VII%20%28USA%29%20%28Disc%203%29.7z -L -b cookie.txt -c cookie.txt -o $HOME/RetroPieInstallation/ps/FinalFantasyVIIUSADisc3.7z

	if [ -f cookie.txt ]; then
		rm cookie.txt
	fi

	mkdir -p $HOME/RetroPie/roms/psx/CastlevaniaX-SymphonyOfTheNight/
	7z e $HOME/RetroPieInstallation/ps/Castlevania-SymphonyoftheNightUSA.7z -o$HOME/RetroPie/roms/psx/CastlevaniaX-SymphonyOfTheNight/
	mkdir -p $HOME/RetroPie/roms/psx/FinalFantasyVII/
	7z e $HOME/RetroPieInstallation/ps/FinalFantasyVIIUSADisc1.7z -o$HOME/RetroPie/roms/psx/FinalFantasyVII/
	7z e $HOME/RetroPieInstallation/ps/FinalFantasyVIIUSADisc2.7z -o$HOME/RetroPie/roms/psx/FinalFantasyVII/
	7z e $HOME/RetroPieInstallation/ps/FinalFantasyVIIUSADisc3.7z -o$HOME/RetroPie/roms/psx/FinalFantasyVII/
fi
