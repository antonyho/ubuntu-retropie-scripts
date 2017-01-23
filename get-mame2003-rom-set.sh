#!/bin/bash
# Get MAME2003 0.78 ROM set

sudo apt-get install -y unzip
mkdir -p $HOME/RetroPieInstallation
cd $HOME/RetroPieInstallation
echo "Getting MAME2003 0.78 ROM set"
wget -b https://archive.org/compress/MAME2003_Reference_Set_MAME0.78_ROMs_CHDs_Samples/formats=ZIP&file=/MAME2003_Reference_Set_MAME0.78_ROMs_CHDs_Samples.zip

unzip MAME2003_Reference_Set_MAME0.78_ROMs_CHDs_Samples.zip -d $HOME/RetroPie/roms/mame-libretro
