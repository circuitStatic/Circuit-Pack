#!/bin/bash

echo ""
echo "|==============================|"
echo "| Debian MAC Changer           |"
echo "|==============================|"
echo ""

echo ""
echo "Checking for Software"
echo ""
sudo apt-get install macchanger

echo ""
echo "Bringing Down Wireless"
echo ""
sudo ifconfig wlan0 down

echo ""
echo "Changing Mac Address"
echo ""
sudo macchanger -A wlan0

echo ""
echo "Bringing Up Wireless"
echo ""
sudo ifconfig wlan0 up

