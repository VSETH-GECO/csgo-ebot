#!/bin/bash
mkdir ~/freenas
sudo mount -t nfs freenas:/mnt/RAID1/csgo ~/freenas
echo Mounted freenas


mkdir ~/freenas/backup
echo Created backup folder

cp ~/csgoebotserver/csgo/*.dem ~/freenas/backup
echo Created Backups of demos

cp  ~/csgoebotserver/csgo/ebot_*.txt ~/freenas/backup
echo Created Backups of roundBackups

sudo umount -f -l ~/freenas
echo Unmounted freenas

rmdir ~/freenas
echo Removed freenas dir