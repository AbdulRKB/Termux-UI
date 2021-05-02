green='\033[1;92m'
yellow='\033[1;93m'
white='\033[1;97m'
cyan='\033[1;96m'
echo "$yellow
================================
Installing packages
================================"
apt update
pkg install ncurses-utils
echo "
======================
Initializing...
======================"
rm $PREFIX/etc/bash.bashrc
cp bash.bashrc $PREFIX/etc
clear
echo "$green
======================================
Now type 'exit' & restart Termux
======================================"
echo ""
echo "$white"
