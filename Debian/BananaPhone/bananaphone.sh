#!/bin/bash

# Install Alpha CodeName:BananaPhone...
# A custom build for Debian on Android Mobile (or similar Debian)
### Circuit Static 

# Elevate
sudo -s

# Make sure everything is ready pre-install
apt-get update && apt-get upgrade

#It depends ;-)
apt-get install -y python python-pip git gcc python-software-properties python3-software-properties software-properties-common unzip dialog libxml2-dev build-essential automake autoconf libtool libpam0g-dev libx11-dev libxfixes-dev libssl-dev libxrandr-dev libxrandr2 pkg-config make libtool g++

#What the Cow Say
#It installs, but doesn't work? Leaving for refrence
apt-get install cowsay

#Multimedia Tools
apt-get -y install vlc ardour audacity lmms 

#Installing Internet stuffs
apt-get install -y lynx filezilla wireshark pbnj etherape aircrack-ng speedometer nload hydra fail2ban putty nginx-full ufw macchanger

#Install Graphics Stuffs 
sudo apt-get -y install blender gimp shutter

#Install Gaming Stuffs
apt-get -y install dosbox assaultcube 

#Install Apache Server
apt-get install -y apache2
#Make an updated Disk Space page
sudo df -h > /var/www/html/disk.html

#Adding Webcontent User Group
groupadd web-content
#Adding user "chris" to webcontent group, change or add for additional
usermod -G web-content chris
#Giving permissions to above user
chown -R chris:web-content /var/www/html
find /var/www/html -type f -exec chmod 640 {} \;
find /var/www/html -type d -exec chmod 750 {} \;
#Making the content folder manageable
sudo chmod -R 775 /var/www/html

#Getting a lightweight PHP instance for LAMP requirements
apt-get install php5 libapache2-mod-php5

#Getting a lightweight SQL server for LAMP requirements
#Requires user interaction
apt-get install -y mysql-client mysql-server

#Install additional Web services, packages, etc
apt-get install tomcat6 vsftpd ruby rails gem

#Update the installed gems now
sudo gem update

#Restart apache server ... for JUSTICE !!!
echo "Restarting Apache Server..."
/etc/init.d/apache2 stop
/etc/init.d/apache2 start

#Update for cleanliness
apt-get update

#Install basic Twitter CLI tools (will not work until after configured)
pip install twitter

#Install Rainbowstream Twitter ANSI CLI
#NOT WORKING ON PHONE, should work on other Debians, keeping for later.
#apt-get install -y python-dev libjpeg-dev libfreetype6 libfreetype6-dev zlib1g-dev
#apt-get install -y virtualenv 
#source venv/bin/activate
#pip install rainbowstream



