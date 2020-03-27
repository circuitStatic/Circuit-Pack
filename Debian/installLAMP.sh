#!/bin/bash

echo "Installing Apache Server"
apt-get install -y apache2

echo "Installing MqSQL"
apt-get install -y mysql-server mysql-client
apt-get install -y flashplugin-installer

echo "Installing PHP"
apt-get install -y php

echo "Restarting Apache Server"
/etc/init.d/apache2 stop
/etc/init.d/apache2 start

echo "LAMP Install Finished. Check for errors"


