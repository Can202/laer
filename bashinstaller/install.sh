#!/bin/bash

SUDO=""

if [ -f "/usr/bin/vim" ] || [ -f "/usr/sbin/vim" ]
then
    echo "vim installed"
else
    echo "you need to install vim"
    exit
fi
if [ -f "/usr/bin/bash" ] || [ -f "/usr/sbin/bash" ]
then
    echo "bash installed"
else
    echo "you need to install bash"
    exit
fi
if [ -f "/usr/bin/neofetch" ] || [ -f "/usr/sbin/neofetch" ]
then
    echo "neofetch installed"
else
    echo "you need to install neofetch"
    exit
fi

if [ -f "/usr/bin/laer" ]
then
	echo "laer is installed"
	exit
fi
echo
echo "Internet Required"
echo
if [ ! $(whoami) = "root" ]
then
	echo "you have to run this script as root"
	
	echo
	echo "Do you wanna try with sudo? (y/n)"
	read try
	if [ $try = "y" ] || [ $try = "Y" ]
	then
		echo "ok!"
		SUDO="sudo"
	else
		echo "aborting"
		exit
	fi
fi

$SUDO mkdir /etc/laer

cd /tmp

$SUDO rm -rf laer

mkdir laer

cd laer

$SUDO curl -OL https://raw.githubusercontent.com/Can202/laer/v0.2/laer
$SUDO curl -OL https://raw.githubusercontent.com/Can202/laer/v0.2/bashinstaller/laer-delete



$SUDO chmod a+x laer-delete
$SUDO chmod a+x laer

$SUDO cp laer /usr/bin/laer
$SUDO cp laer-delete /usr/bin/laer-delete

	
