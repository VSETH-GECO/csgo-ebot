#!/bin/bash
if [[ $1 =~ ^[1-3]{1}$ ]] ; then
	sudo add-apt-repository multiverse 
	sudo add-apt-repository universe 
	sudo dpkg --add-architecture i386
	sudo apt-get update
	sudo apt-get upgrade
	sudo apt-get -y install lib32gcc1 steamcmd nfs-common
	echo Installed steamcmd and nfs-common

	mkdir ~/freenas
	sudo mount -t nfs freenas.geco.local:/mnt/RAID1/csgo ~/freenas
	echo Mounted freenas

	mkdir ~/csgoebotserver
	cp -r -v ~/freenas/cleanserver/ ~/csgoebotserver
	echo Copied CSGOclean to server

	cp -r -v ~/freenas/csgoebotserver ~/
	echo Copied config files to server

	sudo umount -f -l ~/freenas
	echo Unmounted freenas

	rmdir ~/freenas
	echo Removed freenas dir

	chmod +x ~/csgoebotserver/copyCfgs.sh
	echo Made copyCfgs.sh executable

	chmod +x ~/csgoebotserver/updateNAS.sh
	echo Made updateNAS.sh executable

	chmod +x ~/csgoebotserver/update.sh
	echo Made update.sh executable

	chmod +x ~/csgoebotserver/start$1.sh
	echo Made start$1.sh executable

	chmod +x ~/csgoebotserver/start${1}WM.sh
	echo Made start${1}WM.sh executable

	chmod +x ~/csgoebotserver/backup.sh
	echo Made backup.sh executable

	ln -s ~/csgoebotserver/start$1.sh ~/startMatch.sh
	echo Created simlink to start.sh

	ln -s ~/csgoebotserver/start${1}WM.sh ~/startMatchWM.sh
	echo Created simlink to startWM.sh

	ln -s ~/csgoebotserver/backup.sh ~/backup.sh
	echo Created simlink to backup.sh
else
	echo Use parameter between 1-3
fi