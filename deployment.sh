# Author: Rayhanul Karim
# Development Date: 08/27/2025
# Program Name: deployment.sh
# Description: Will be added

#!/bin/bash

countDown(){
	count=5
	echo "Starting countdown of $count seconds for root password entree"

	while [ $count -gt 0 ]; do
		echo $count
		sleep 1
		count=$((count - 1))
	done
}

echo "This Program Uses XAMPP to automate your web application deployment(Requires root login)"
echo "For more information visit: https://web-development-class.readthedocs.io/en/latest/semester_1/06_server_management/02_web_server_setup/web_server_setup.html"
DEFAULT_DOWNLOAD="/home/$(whoami)/Downloads"
countDown
#udo su -

if [[ ! -d "/opt/lampps" ]]; then
	echo "XAMPP is not installed"
 	echo "Would you like to install XAMPP?(Y/n)"
 	read CHOICE
else
	echo "XAMPP is installed!"

fi

case $CHOICE in
	Y|y)
		sudo curl -L -o "$DEFAULT_DOWNLOAD/xampp-linux-x64-8.2.12-0-installer.run" \
		-A "Mozilla/5.0" \
		https://www.apachefriends.org/xampp-files/8.2.12/xampp-linux-x64-8.2.12-0-installer.run
		sudo chmod +x "$DEFAULT_DOWNLOAD/xampp-linux-x64-8.2.12-0-installer.run"
		sudo bash "$DEFAULT_DOWNLOAD/xampp-linux-x64-8.2.12-0-installer.run"
		;;
	N|n)
		exit
		;;
	*)
		echo "Wrong input!!"
	;;
esac

