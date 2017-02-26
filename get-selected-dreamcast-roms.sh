#!/bin/bash
# My favourite Dreamcast selection
# Ikaruga **Emulation doesn't seem to work well
# Sakura Taisen(s)

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

	# Ikaruga
	mkdir -p $HOME/RetroPieInstallation/dc/Ikaruga
	curl https://archive.org/download/RedumpSegaDreamcast20160613/Ikaruga%20%28Japan%29.zip -L -b cookie.txt -c cookie.txt -o $HOME/RetroPieInstallation/dc/Ikaruga/Ikaruga-Japan.zip
	# Sakura Taisen
	mkdir -p $HOME/RetroPieInstallation/dc/SakuraTaisen1
	curl https://archive.org/download/RedumpSegaDreamcast20160613/Sakura%20Taisen%20%28Japan%29%20%28Disc%201%29.zip  -L -b cookie.txt -c cookie.txt -o $HOME/RetroPieInstallation/dc/SakuraTaisen1/SakuraTaisen-Japan-Disc1.zip
	curl https://archive.org/download/RedumpSegaDreamcast20160613/Sakura%20Taisen%20%28Japan%29%20%28Disc%202%29.zip  -L -b cookie.txt -c cookie.txt -o $HOME/RetroPieInstallation/dc/SakuraTaisen1/SakuraTaisen-Japan-Disc2.zip
	curl https://archive.org/download/RedumpSegaDreamcast20160613/Sakura%20Taisen%20%28Japan%29%20%28Omake%20Disc%29.zip  -L -b cookie.txt -c cookie.txt -o $HOME/RetroPieInstallation/dc/SakuraTaisen1/SakuraTaisen-Japan-Omake-Disc.zip

	# Sakura Taisen 2
	mkdir -p $HOME/RetroPieInstallation/dc/SakuraTaisen2
	curl https://archive.org/download/RedumpSegaDreamcast20160613/Sakura%20Taisen%202%20-%20Kimi%2c%20Shinitamou%20Koto%20Nakare%20%28Japan%29%20%28Disc%201%29.zip -L -b cookie.txt -c cookie.txt -o $HOME/RetroPieInstallation/dc/SakuraTaisen2/SakuraTaisen2-Japan-Disc1.zip
	curl https://archive.org/download/RedumpSegaDreamcast20160613/Sakura%20Taisen%202%20-%20Kimi%2c%20Shinitamou%20Koto%20Nakare%20%28Japan%29%20%28Disc%202%29.zip -L -b cookie.txt -c cookie.txt -o $HOME/RetroPieInstallation/dc/SakuraTaisen2/SakuraTaisen2-Japan-Disc2.zip
	curl https://archive.org/download/RedumpSegaDreamcast20160613/Sakura%20Taisen%202%20-%20Kimi%2c%20Shinitamou%20Koto%20Nakare%20%28Japan%29%20%28Disc%203%29.zip -L -b cookie.txt -c cookie.txt -o $HOME/RetroPieInstallation/dc/SakuraTaisen2/SakuraTaisen2-Japan-Disc3.zip

	# Sakura Taisen 3
	mkdir -p $HOME/RetroPieInstallation/dc/SakuraTaisen3
	curl https://archive.org/download/RedumpSegaDreamcast20160613/Sakura%20Taisen%203%20-%20Paris%20wa%20Moeteiru%20ka%20%28Japan%29%20%28Disc%201%29.zip -L -b cookie.txt -c cookie.txt -o $HOME/RetroPieInstallation/dc/SakuraTaisen3/SakuraTaisen3-Japan-Disc1.zip
	curl https://archive.org/download/RedumpSegaDreamcast20160613/Sakura%20Taisen%203%20-%20Paris%20wa%20Moeteiru%20ka%20%28Japan%29%20%28Disc%202%29.zip -L -b cookie.txt -c cookie.txt -o $HOME/RetroPieInstallation/dc/SakuraTaisen3/SakuraTaisen3-Japan-Disc2.zip
	curl https://archive.org/download/RedumpSegaDreamcast20160613/Sakura%20Taisen%203%20-%20Paris%20wa%20Moeteiru%20ka%20%28Japan%29%20%28Disc%203%29.zip -L -b cookie.txt -c cookie.txt -o $HOME/RetroPieInstallation/dc/SakuraTaisen3/SakuraTaisen3-Japan-Disc3.zip
	curl https://archive.org/download/RedumpSegaDreamcast20160613/Sakura%20Taisen%203%20-%20Paris%20wa%20Moeteiru%20ka%20-%20Drama%20Download%20Disc%20%28Japan%29.zip -L -b cookie.txt -c cookie.txt -o $HOME/RetroPieInstallation/dc/SakuraTaisen3/SakuraTaisen3-Japan-DramaDownloadDisc.zip

	# Sakura Taisen 4
	mkdir -p $HOME/RetroPieInstallation/dc/SakuraTaisen4
	curl https://archive.org/download/RedumpSegaDreamcast20160613/Sakura%20Taisen%204%20-%20Koi%20Se%20Yo%20Otome%20%28Japan%29.zip -L -b cookie.txt -c cookie.txt -o $HOME/RetroPieInstallation/dc/SakuraTaisen4/SakuraTaisen4-Japan.zip

	if [ -f cookie.txt ]; then
		rm cookie.txt
	fi

	mkdir -p $HOME/RetroPie/roms/dc/Ikaruga-Japan/
	unzip $HOME/RetroPieInstallation/dc/Ikaruga/Ikaruga-Japan.zip -d $HOME/RetroPie/roms/dreamcast/Ikaruga-Japan/

	mkdir -p $HOME/RetroPie/roms/dc/SakuraTaisen1/
	unzip $HOME/RetroPieInstallation/dc/SakuraTaisen1/SakuraTaisen-Japan-Disc1.zip -d $HOME/RetroPie/roms/dreamcast/SakuraTaisen1/
	unzip $HOME/RetroPieInstallation/dc/SakuraTaisen1/SakuraTaisen-Japan-Disc2.zip -d $HOME/RetroPie/roms/dreamcast/SakuraTaisen1/
	unzip $HOME/RetroPieInstallation/dc/SakuraTaisen1/SakuraTaisen-Japan-Omake-Disc.zip -d $HOME/RetroPie/roms/dreamcast/SakuraTaisen1/

	mkdir -p $HOME/RetroPie/roms/dc/SakuraTaisen2/
	unzip $HOME/RetroPieInstallation/dc/SakuraTaisen2/SakuraTaisen2-Japan-Disc1.zip -d $HOME/RetroPie/roms/dreamcast/SakuraTaisen2/
	unzip $HOME/RetroPieInstallation/dc/SakuraTaisen2/SakuraTaisen2-Japan-Disc2.zip -d $HOME/RetroPie/roms/dreamcast/SakuraTaisen2/
	unzip $HOME/RetroPieInstallation/dc/SakuraTaisen2/SakuraTaisen2-Japan-Disc3.zip -d $HOME/RetroPie/roms/dreamcast/SakuraTaisen2/

	mkdir -p $HOME/RetroPie/roms/dc/SakuraTaisen3/
	unzip $HOME/RetroPieInstallation/dc/SakuraTaisen3/SakuraTaisen3-Japan-Disc1.zip -d $HOME/RetroPie/roms/dreamcast/SakuraTaisen3/
	unzip $HOME/RetroPieInstallation/dc/SakuraTaisen3/SakuraTaisen3-Japan-Disc2.zip -d $HOME/RetroPie/roms/dreamcast/SakuraTaisen3/
	unzip $HOME/RetroPieInstallation/dc/SakuraTaisen3/SakuraTaisen3-Japan-Disc3.zip -d $HOME/RetroPie/roms/dreamcast/SakuraTaisen3/
	unzip $HOME/RetroPieInstallation/dc/SakuraTaisen3/SakuraTaisen3-Japan-DramaDownloadDisc.zip -d $HOME/RetroPie/roms/dreamcast/SakuraTaisen3/

	mkdir -p $HOME/RetroPie/roms/dc/SakuraTaisen4/
	unzip $HOME/RetroPieInstallation/dc/SakuraTaisen4/SakuraTaisen4-Japan.zip -d $HOME/RetroPie/roms/dreamcast/SakuraTaisen4/

fi
