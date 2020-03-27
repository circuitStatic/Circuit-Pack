#!/bin/bash

# Check if user is root
if [ $(id -u) != "0" ]; then
	echo "Error: You must be root to run this script, please use the root user to install the software."
	exit 1
fi

# Check if it's a Debian distro
if [ ! -f /etc/debian_version ]; then
	echo "Unsupported Linux distribution. Prepared for Debian"
	exit 1
fi

sh installLamp.sh

sh installNetworking.sh

sh installProgramming.sh

sh installWebServices.sh

sh cleaner.sh

echo "All scripts should have completed. Check above for errors"


