#!/bin/bash
clear
curdate=$(date +"%Y/%m/%d - %H:%M:%S")
echo "--INSTALL--"
echo "[*] Bash Version: ${BASH_VERSION}"
echo "[*] Date: $curdate"
argc=$#
user=$(whoami)
usage="./install <package1> <package2> <package3> ..."
if [ $user != "root" ]; then
	echo "[*] Run as root"
	exit
fi

if [ $argc = 0 ]; then
	echo "[*] Invalid number of arguments"
	echo "Usage: "$usage
	exit
fi

cmd="apt install -y"
for p in $@; do
	cmd="${cmd} ${p}"
done

echo "[*] Command Line: "$cmd
echo "[*] Installing..."
echo "# $curdate #" &>> logs.out
eval $cmd &>> logs.out
echo "" &>> logs.out
echo "" &>> logs.out
echo "--------------------------------------------------" &>> logs.out
echo "[*] Installed"