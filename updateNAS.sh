#!/bin/bash
mkdir ~/freenas
sudo mount -t nfs freenas:/mnt/RAID1/csgo ~/freenas
echo Mounted freenas

sudo apt-get -y install steamcmd
echo Installed SteamCMD

steamcmd +login anonymous +force_install_dir ~/freenas/cleanserver +app_update 740 +quit
echo Update CSGO on nas

sudo umount -f -l ~/freenas
echo Unmounted freenas

rmdir freenas