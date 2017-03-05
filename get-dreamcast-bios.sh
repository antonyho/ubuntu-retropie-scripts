#!/bin/bash
# Download the BIOS files for Dreamcast emulator
# Dreamcast emulator should be downloaded in RetroPie config
# Steps:
#   RETROPIE SETUP
#     RetroArch
#       Manage packages
#         opt    Manage optional packages
#           reicast

command -v unzip >/dev/null 2>&1 || { sudo apt-get install -y unzip; }

mkdir -p $HOME/RetroPieInstallation/dc/BIOS
curl http://50.7.136.26/as981lLNbabc6u10hHaksHcb122/epforums/upload/2/3/4/5/2/821811740799914687.zip -o $HOME/RetroPieInstallation/dc/dreamcast-bios.zip
unzip $HOME/RetroPieInstallation/dc/dreamcast-bios.zip -d $HOME/RetroPieInstallation/dc/BIOS/
cp "$HOME/RetroPieInstallation/dc/BIOS/SEGA_Dreamcast_BIOS/dc_bios.bin" $HOME/RetroPie/BIOS/
cp "$HOME/RetroPieInstallation/dc/BIOS/SEGA_Dreamcast_Flash_BIOS_J/dc_flash.bin" $HOME/RetroPie/BIOS/dc_flash.bin
