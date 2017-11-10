#/bin/bash
apt-get -y install redshift
redshift -O 3500
apt remove firefox
apt remove gimp*
apt remove hexchat
apt remove pidgin
apt remove thunderbird
apt remove compiz
apt remove compiz*
apt remove blueberry
apt remove tomboy
apt remove gnome-orca
apt remove onboard
apt remove vino
apt remove bluez
apt remove xzoom
apt remove shotwell
apt remove shotwell-common
apt remove synapse
apt remove plank
apt remove  brasero*
apt install git
apt install maven
apt install vrms
apt install deborphan
apt install texstudio

apt autoremove
apt clean
apt update
apt upgrade
apt autoremove
apt clean
