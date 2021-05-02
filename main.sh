green='\033[1;92m'
yellow='\033[1;93m'
white='\033[1;97m'
cyan='\033[1;96m'
echo "$yellow
=================================
Created By Cyber Titus
================================="
echo ""
echo ""
echo "$yellow
================================
Installing packages
================================"
apt update
apt install ruby -y
gem install lolcat
echo "green
======================
Done
======================"
echo ""
echo ""
echo "
======================
Initializing...
======================"
rm $PREFIX/etc/bash.bashrc
cp bash.bashrc $PREFIX/etc
echo "green
======================
Done
======================"
clear
echo "$yellow
=================================
Created By Cyber Titus
================================="
echo "$yellow
Website: CyberTitus.github.io
================================="
echo "$yellow
github.com/CyberTitus
================================="
echo ""
echo "$green
======================================
Now type 'exit' & restart Termux
======================================"
echo ""
echo "$white"
