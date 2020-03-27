# Install Shell Script
# V.0.0.1

# Elevate
sudo -s

# Make sure everything is ready pre-install
apt-get update && apt-get upgrade

# Install LAMP Server
apt-get install apache2 php5 mysql-client mysql-server 
#Install additional Web services, packages, etc
apt-get install tomcat6 vsftpd ufw

##
# Install git and dialog
sudo apt-get install git dialog

# Git the RetroPie stuff too
cd
git clone --depth=0 https://github.com/petrockblog/RetroPie-Setup
cd RetroPie-Setup
chmod +x retropie_setup.sh
sudo ./retropie_setup.sh
cd ~

#Install Multimedia software
apt-get install -y vlc
 


# Create initial index page
cd /var/www
nano index.html
