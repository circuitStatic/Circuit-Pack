#!/bin/bash

# Install Alpha CodeName:CinnaBuntu v0.02...
# A custom build for Ubuntu 14.04 (or similar Debian)
# Add Cinnamon 2.4 desktop & other goodies
### Circuit Static 

# Initial update
sudo apt-get update

# What the Cow Say
sudo apt-get install cowsay

# Because I want music for the rest of this
cowsay -f three-eyes "Installing VLC"
sudo apt-get -y install vlc

### Add more sources
# Google Chrome Stable Repo
wget -q -O - https://dl-ssl.google.com/linux/linux_signing_key.pub | sudo apt-key add -
sudo sh -c 'echo "deb http://dl.google.com/linux/chrome/deb/ stable main" >> /etc/apt/sources.list.d/google.list'
# Video Game Controller Repos
sudo add-apt-repository ppa:falk-t-j/qtsixa

# Update from new and existing sources
sudo apt-get update

# Now I will want Chrome to surf the net for the rest of the install
cowsay -f kosh "Installing Google Chrome"
sudo apt-get -y install google-chrome-stable

# Now with Cimmanon (tm)
cowsay -f vader "Adding Cinnamon 2.4 to Ubuntu 14.04 LTS"
sudo add-apt-repository ppa:gwendal-lebihan-dev/cinnamon-nightly
sudo apt-get update && sudo apt-get install cinnamon

### S0FTWARE ###

#Utilities
cowsay "Installing Utilities"
sudo apt-get -y install filezilla transmission recordmydesktop p7zip cairo-dock

#Virtualization
cowsay "Installing Virtualization Software"
sudo apt-get -y install wine playonlinux virtualbox

# Programming
cowsay "Installing Programming Software"
sudo apt-get install -y install git python gcc

# Graphics
cowsay "Installing Graphics Manipulators"
sudo apt-get -y install blender gimp shutter

# Gaming
cowsay -s "Installing Games and Emulators"
sudo apt-get -y install assaultcube dosbox zsnes
# Controllers
cowsay -f tux "Installing Joystick Controllers"
sudo apt-get install libusb-dev libusb-0.1-4 xserver-xorg-input-joystick qtsixa sixad xboxdrv

# Networking
cowsay "Installing Network and Security Tools"
sudo apt-get -y install wireshark pbnj etherape aircrack-ng speedometer nload hydra fail2ban putty lynx nginx-full ufw

# Multimedia
cowsay "Installing Music Production and Mastering Software"
sudo apt-get -y install ardour audacity lmms 

### Removing the stuff I dont use and have just replaced
echo "Removing unused software"
sudo apt-get -y remove firefox
