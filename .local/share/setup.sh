#! /bin/sh

printf "\n\nGetting fastest repo! : \n\n"
sudo cp -rv src/mirror/00-repository-main.conf /etc/xbps.d/

printf"\n\nUpgrading and Installing Tools : \n\n"
sudo xbps-install -Sy xbps
sudo xbps-install -yu
sudo xbps-install -y $(cat $HOME/.local/share/packages/xbps-package)
