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
curl https://www.loveroms.com/extras/files/bios/dreamcast-bios.zip -o $HOME/RetroPieInstallation/dc/
unzip $HOME/RetroPieInstallation/dc/dreamcast-bios.zip -d $HOME/RetroPieInstallation/dc/BIOS/
cp "$HOME/RetroPieInstallation/dc/BIOS/DC - BIOS (All).bin" $HOME/RetroPie/BIOS/dc_boot.bin
cp "$HOME/RetroPieInstallation/dc/BIOS/DC - Flash (All).bin" $HOME/RetroPie/BIOS/dc_flash.bin
