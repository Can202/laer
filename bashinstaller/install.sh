#!/bin/sh

SUDO=""

if [ -f "/usr/bin/laer" ]
then
	echo "laer is installed"
	exit
fi
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

cd /tmp

$SUDO rm -rf laer

mkdir laer

cd laer

$SUDO curl -OL https://github.com/Can202/laer/releases/download/v0.1/laer



echo "
#!/bin/sh

SUDO=\"\"
if [ ! $(whoami) = \"root\" ]
then
	echo \"you have to run this script as root\"
	
	echo
	echo \"Do you wanna try with sudo? (y/n)\"
	read try
	if [ $try = \"y\" ] || [ $try = \"Y\" ]
	then
		echo \"ok!\"
		SUDO=\"sudo\"
	else
		echo \"aborting\"
		exit
	fi
fi

$SUDO rm -f /usr/bin/laer
$SUDO rm -f /usr/bin/laer-delete
" > laer-delete
$SUDO chmod a+x laer-delete
$SUDO chmod a+x laer

$SUDO cp laer /usr/bin/laer
$SUDO cp laer-delete /usr/bin/laer-delete

	
