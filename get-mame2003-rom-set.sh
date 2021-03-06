#!/bin/bash
# Get MAME2003 0.78 ROM set

command -v unzip >/dev/null 2>&1 || { sudo apt-get install -y unzip; }
command -v curl >/dev/null 2>&1 || { sudo apt-get install -y curl; }

mkdir -p $HOME/RetroPieInstallation
cd $HOME/RetroPieInstallation
echo "Getting MAME2003 0.78 ROM set"
curl https://archive.org/compress/MAME2003_Reference_Set_MAME0.78_ROMs_CHDs_Samples/formats=ZIP&file=/MAME2003_Reference_Set_MAME0.78_ROMs_CHDs_Samples.zip/roms -o MAME2003_Reference_Set_MAME0.78_ROMs.zip
curl https://archive.org/compress/MAME2003_Reference_Set_MAME0.78_ROMs_CHDs_Samples/formats=ZIP&file=/MAME2003_Reference_Set_MAME0.78_ROMs_CHDs_Samples.zip/samples -o MAME2003_Reference_Set_MAME0.78_Samples.zip

unzip $HOME/RetroPieInstallation/MAME2003_Reference_Set_MAME0.78_ROMs.zip -d $HOME/RetroPie/roms/arcade/
unzip $HOME/RetroPieInstallation/MAME2003_Reference_Set_MAME0.78_Samples.zip -d $HOME/RetroPie/BIOS/mame2003/samples/
