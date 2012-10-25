#!/bin/bash
echo "DIY Magic Mirror LINUX Installation"
echo "Installing ser2net serial proxy component"
sudo apt-get install ser2net -y
echo "Copying ser2net.conf to /etc directory"
sudo cp '/opt/DIY Magic Mirror/mirror/share/linux/ser2net.conf' /etc
echo "Setting mirror.xml to write"
sudo chmod a+w '/opt/DIY Magic Mirror/mirror/share/mirror.xml'
exit 1

