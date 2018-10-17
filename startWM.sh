#!/bin/bash
if [[ $1 =~ ^[1-8]{1}$ ]]
then
	if ! screen -list | grep -q csMatch$1 ; then
		HOSTNAME=$(hostname)
		IP=$(hostname -I | awk '{print substr($1,1)   }')
		PORT=$(( 27020+$1 ))
		TVPORT=$(( 27120+$1 ))
		screen -d -m -S csMatch$1 ~/csgoebotserver/srcds_run -game csgo -console -usercon -tickrate 128 +exec preWM +map aim_redline -port $PORT +tv_port $TVPORT +ip $IP +hostname PolyLAN-WM$HOSTNAME$1 +tv_name PolyTV-WM$HOSTNAME$1 +tv_title PolyTV-WM$HOSTNAME$1
		echo Started $HOSTNAME\.$1 on $IP:$PORT/:$TVPORT
	else
		echo Screen csMatch$1 is already running.
	fi
else
	echo Use parameter between 1-8
fi