#!/bin/bash

echo $"
         _________
        d         b
       d           b
      d             b
     d               b
    d                 b
     ''':::.....:::'''
            fff
          .'   '.
         ^       ^.'--.
         b       d     ,
          czzzzzd       ..oOo

LAMP (Top-of-Stack) Installer by Circuit
" 

echo "
Installing Apache Server
"
sudo yum install httpd

echo "
Starting Apache Server
"
sudo service httpd start

echo "
Opening Port :80 on Apache Firewall
"
sudo iptables -A INPUT -p tcp --dport 80 -j ACCEPT
sudo /sbin/service iptables save

echo "
Restarting Firewall for Changes to Take Effect
"
sudo service iptables restart

echo "
Installing MySQL
"
sudo yum install mysql

echo "
Installing PHP
"
sudo yum install php php-mysql

# Above Ends L(AMP) install. This section is additional common Linux Server Programs

selection=
until [ "$selection" = "0" ]; do
    echo ""
    echo "LAMP INSTALLED. CONTINUE WITH ADDITIONAL SOFTWARE?"
    echo "1 - Yes, Install Ruby on Rails & Java 1.7"
    echo "2 - No, Exit Installer"
    echo ""
    echo -n "Enter selection: "
    read selection
    echo ""
    case $selection in
        1 ) 
echo "Installing Ruby on Rails"
sudo yum install ruby
sudo yum install gcc g++ make automake autoconf curl-devel openssl-devel zlib-devel httpd-devel apr-devel apr-util-devel sqlite-devel
sudo yum install ruby-rdoc ruby-devel
sudo gem update
sudo gem update --system
sudo gem install rails

#Install Java JDK (1.7)
sudo yum install java-1.7.0-openjdk java-1.7.0-openjdk-devel 

# Set Java Home
export JAVA_HOME=/opt/java/jdk_1.7.0/
export PATH= ${PATH}:{JAVA_HOME}/bin
;;
        2 ) exit ;;
        * ) echo "Please enter 1, or 2"
    esac
done



