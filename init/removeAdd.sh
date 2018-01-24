#/bin/bash
apt-get -y install redshift
redshift -O 3500
apt -y remove firefox
apt -y remove gimp*
apt -y remove hexchat
apt -y remove pidgin
apt -y remove thunderbird
#apt remove compiz
#apt remove compiz*
apt -y remove blueberry
apt -y remove tomboy
apt -y remove gnome-orca
apt -y remove onboard
apt -y remove vino
apt -y remove bluez
apt -y remove xzoom
apt -y remove shotwell
apt -y remove shotwell-common
apt -y remove synapse
apt -y remove plank
apt -y remove  brasero*
apt -y install git
apt -y install maven
apt -y install vrms
apt -y install deborphan
apt -y install texstudio
apt -y install kolourpaint

apt autoremove
apt clean
apt update
apt upgrade
apt autoremove
apt clean
