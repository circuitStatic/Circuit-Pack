#!/bin/bash

echo "Updating Repositories"
sudo apt-get update

echo "Installing L(AMP)..."

echo "Installing Apache Server..."
sudo apt-get install apache2

echo "Installing MySql..."
sudo apt-get install mysql-server mysql-client
sudo apt-get install flashplugin-installer

echo "Installing PHP.."
sudo apt-get install php5 libapache2-mod-php5

echo "Restarting Apache Server..."
/etc/init.d/apache2 stop
/etc/init.d/apache2 start

echo "L(AMP) Install Finished"

