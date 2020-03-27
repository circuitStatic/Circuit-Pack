#!/bin/bash

echo "Checking for any updates"
apt-get update -y && apt-get upgrade

echo "Removing any junk packages"
apt-get autoremove -y




