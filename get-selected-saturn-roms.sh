#!/bin/bash
# My favourite Sega Saturn selection
# Akumajou Dracula X Gekka no Yasoukyoku
# Dragon Force
# Dragon Force II
# Guardian Heroes
# Sakura Taisen
# Sakura Taisen 2

# https://archive.org/details/No-Intro-Collection_2016-01-03_Fixed

if [ $# -lt 2 ]; then
	echo "This script requires archive.org username and password in order to start downloading."
	echo "Usage:"
	echo "./get-selected-saturn-roms.sh <username> <password>"
else
	command -v 7z >/dev/null 2>&1 || { sudo apt-get install -y p7zip-full; }
	command -v curl >/dev/null 2>&1 || { sudo apt-get install -y curl; }

	mkdir -p $HOME/RetroPieInstallation/saturn
	cd $HOME/RetroPieInstallation/saturn
	echo "Getting my selected Sega Saturn games from no-intro ROM set"
	curl https://archive.org/account/login.php -c cookie.txt >/dev/null
	curl https://archive.org/account/login.php -b cookie.txt -c cookie.txt -F "username=$1" -F "password=$2" -F "referer=https://archive.org/" -F "action=login" -F "submit=Log in" >/dev/null
	curl https://archive.org/ -b cookie.txt -c cookie.txt >/dev/null

	curl https://archive.org/download/SgaStrnCmplt/Akumajou%20Dracula%20X%20-%20Gekka%20no%20Yasoukyoku%20%28Japan%29%20%282M%29.7z -L -b cookie.txt -c cookie.txt -o $HOME/RetroPieInstallation/saturn/AkumajouDraculaX-GekkanoYasoukyoku.7z
	curl https://archive.org/download/SgaStrnCmplt/Dragon%20Force%20%28USA%29.7z -L -b cookie.txt -c cookie.txt -o $HOME/RetroPieInstallation/saturn/DragonForceUSA.7z
	curl https://archive.org/download/SgaStrnCmplt/Dragon%20Force%20II%20-%20Kami%20Sarishi%20Daichi%20ni%20%28Japan%29.7z -L -b cookie.txt -c cookie.txt -o $HOME/RetroPieInstallation/saturn/DragonForceII-KamiSarishiDaichiniJapan.7z
	curl https://archive.org/download/SgaStrnCmplt/Guardian%20Heroes%20%28USA%29.7z -L -b cookie.txt -c cookie.txt -o $HOME/RetroPieInstallation/saturn/GuardianHeroesUSA.7z
	curl https://archive.org/download/SgaStrnCmplt/Sakura%20Taisen%20%28Japan%29%20%28Disc%201%29%20%288M%29.7z -L -b cookie.txt -c cookie.txt -o $HOME/RetroPieInstallation/saturn/SakuraWarsJapanDisc1.7z
	curl https://archive.org/download/SgaStrnCmplt/Sakura%20Taisen%20%28Japan%29%20%28Disc%202%29%20%289M%29.7z -L -b cookie.txt -c cookie.txt -o $HOME/RetroPieInstallation/saturn/SakuraWarsJapanDisc2.7z
	curl https://archive.org/download/SgaStrnCmplt/Sakura%20Taisen%202%20-%20Kimi%2c%20Shinitamou%20Koto%20Nakare%20%28Japan%29%20%28Disc%201%29%20%28Rev%20A%29%20%2810M%29.7z -L -b cookie.txt -c cookie.txt -o $HOME/RetroPieInstallation/saturn/SakuraWars2JapanDisc1.7z
	curl https://archive.org/download/SgaStrnCmplt/Sakura%20Taisen%202%20-%20Kimi%2c%20Shinitamou%20Koto%20Nakare%20%28Japan%29%20%28Disc%202%29%20%28Rev%20A%29%20%2810M%2c%2011M%29.7z -L -b cookie.txt -c cookie.txt -o $HOME/RetroPieInstallation/saturn/SakuraWars2JapanDisc2.7z
	curl https://archive.org/download/SgaStrnCmplt/Sakura%20Taisen%202%20-%20Kimi%2c%20Shinitamou%20Koto%20Nakare%20%28Japan%29%20%28Disc%203%29%20%28Rev%20A%29%20%2812M%29.7z -L -b cookie.txt -c cookie.txt -o $HOME/RetroPieInstallation/saturn/SakuraWars2JapanDisc3.7z

	if [ -f cookie.txt ]; then
		rm cookie.txt
	fi

	mkdir -p $HOME/RetroPie/roms/saturn/DraculaX/
	mkdir -p $HOME/RetroPie/roms/saturn/DragonForce/
	mkdir -p $HOME/RetroPie/roms/saturn/DragonForceII/
	mkdir -p $HOME/RetroPie/roms/saturn/GuardianHeroes/
	mkdir -p $HOME/RetroPie/roms/saturn/SakuraWarsJapan/
	mkdir -p $HOME/RetroPie/roms/saturn/SakuraWars2Japan/
	7z e $HOME/RetroPieInstallation/saturn/AkumajouDraculaX-GekkanoYasoukyoku.7z -o$HOME/RetroPie/roms/saturn/DraculaX/
	7z e $HOME/RetroPieInstallation/saturn/DragonForceUSA.7z -o$HOME/RetroPie/roms/saturn/DragonForce/
	7z e $HOME/RetroPieInstallation/saturn/DragonForceII-KamiSarishiDaichiniJapan.7z -o$HOME/RetroPie/roms/saturn/DragonForceII/
	7z e $HOME/RetroPieInstallation/saturn/GuardianHeroesUSA.7z -o$HOME/RetroPie/roms/saturn/GuardianHeroes/
	7z e $HOME/RetroPieInstallation/saturn/SakuraWarsJapanDisc1.7z -o$HOME/RetroPie/roms/saturn/SakuraWarsJapan/
	7z e $HOME/RetroPieInstallation/saturn/SakuraWarsJapanDisc2.7z -o$HOME/RetroPie/roms/saturn/SakuraWarsJapan/
	7z e $HOME/RetroPieInstallation/saturn/SakuraWars2JapanDisc1.7z -o$HOME/RetroPie/roms/saturn/SakuraWars2Japan/
	7z e $HOME/RetroPieInstallation/saturn/SakuraWars2JapanDisc2.7z -o$HOME/RetroPie/roms/saturn/SakuraWars2Japan/
	7z e $HOME/RetroPieInstallation/saturn/SakuraWars2JapanDisc3.7z -o$HOME/RetroPie/roms/saturn/SakuraWars2Japan/
fi
