#!/bin/bash

SUDO=""

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

cd /tmp

$SUDO rm -rf laer

mkdir laer

cd laer

$SUDO curl -OL https://github.com/Can202/laer/releases/download/v0.2/laer



echo "
#!/bin/bash

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

if [ -f \"/etc/laer/linked\" ]
then
    LINKED=$(cat /etc/laer/linked)
    COLINKED=$(cat /usr/bin/$LINKED)
    CORIGINAL=$(cat /usr/bin/laer)
    COOCORTED=${CORIGINAL:0:25}
    COLCORTED=${COLINKED:0:25}
    
	if [[ $COOCORTED = $COLCORTED ]]
	then
        echo \"You've been created a link\" 
		$SUDO rm -f /usr/bin/$LINKED
		echo \"link removed\"
	fi
	$SUDO rm -f /etc/laer/linked
	echo \"link name removed\"
fi

$SUDO rm -f /usr/bin/laer
$SUDO rm -f /usr/bin/laer-delete
" > laer-delete
$SUDO chmod a+x laer-delete
$SUDO chmod a+x laer

$SUDO cp laer /usr/bin/laer
$SUDO cp laer-delete /usr/bin/laer-delete

	
