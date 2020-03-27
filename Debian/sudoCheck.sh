#!/bin/bash

# Check if user is root
if [ $(id -u) != "0" ]; then
	echo "Error: You must be root to run this script, please use the root user to install the software."
	exit 1
fi
