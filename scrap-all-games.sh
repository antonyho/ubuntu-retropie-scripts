#!/bin/bash
# https://github.com/RetroPie/RetroPie-setup/wiki/scraper
# https://github.com/sselph/scraper
# https://www.reddit.com/r/RetroPie/comments/33qf7s/emulationstation_manual_scraping/

command -v go >/dev/null 2>&1 || { sudo apt-get install -y golang; }

# Create a GoLang home directory
mkdir -p $HOME/go
export GOPATH=$HOME/go

mkdir -p $HOME/RetroPieInstallation
cd $HOME/RetroPieInstallation
go get github.com/sselph/scraper
go build github.com/sselph/scraper

scraper -scrape_all
