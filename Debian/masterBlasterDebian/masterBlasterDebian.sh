#!/bin/bash

# Complete Debian installer script
# Pieces were taken from multiple project to make one script
# I have far too many different install scripts now.
# This is the Circuit Static universal Debian installer of suggested packages.
### Circuit Static 

# Check if user is root
if [ $(id -u) != "0" ]; then
    echo "Error: You must be root to run this script, please use the root user to install the software."
    exit 1
fi

# Debian only
if [ ! -f /etc/debian_version ]; then 
    echo "Unsupported Linux Distribution. Prepared for Debian"
    exit 1
fi

#Update
sudo apt-get update

#Programming & Dependencies
apt-get install -y dialog gcc unzip make wget pkg-config perl curl screen automake autoconf libtool build-essential software-properties-common git g++ dnsutils alsa-base alsa-utils html2text autotools-dev libfreetype6 libjpeg-dev libfreetype6-dev zlib1g-dev libpam0g-dev libx11-dev libxfixes-dev libssl-dev libxrandr-dev libxrandr2 libxml2-dev libjemalloc-dev libncurses-dev libpcre3-dev libedit-dev links2 python python-pip python-imaging python-sphinx python-docutils ruby rails gem

#Python PIP Installs
pip install twitter
#pip install Pillow
#pip install rainbowstream

#Multimedia
apt-get install -y vlc gimp blender shutter imagemagick ardour audacity lmms

#Networking
apt-get install -y filezilla transmission wireshark nmap etherape pbnj aircrack-ng wifite speedometer nload hydra fail2ban putty lynx ufw nginx-full macchanger

#Utilities
apt-get install -y p7zip

#Virtualization
apt-get install -y wine playonlinux virtualbox dosbox

#Server Package
#apt-get install -y apache2 php5 libapache2-mod-php5 mysql-client mysql-server tomcat6 openssh-server

echo Applying package manager fixes...
sudo apt-get clean
sudo dpkg --configure -a
sudo apt-get -yf install

echo
echo Installations should be finished
echo check the terminal output above with any errors
echo 
echo Here is your remaining space after installation:
echo
df -h

