#!/bin/bash
mkdir ~/freenas
sudo mount -t nfs freenas:/mnt/RAID1/csgo ~/freenas
echo Mounted freenas

yes | cp -rf -v ~/freenas/csgoebotserver ~/
echo Copied Files from git to server

sudo umount -f -l ~/freenas
echo Unmounted freenas

rmdir ~/freenas
echo Removed freenas dir