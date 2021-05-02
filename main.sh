echo "
================================
Installing packages..
================================"
apt update
pkg install ncurses-utils -y
echo "
======================
Initializing...
======================"
rm $PREFIX/etc/bash.bashrc
cp bash.bashrc $PREFIX/etc
clear
echo "
======================================
Please Reopen Termux to see changes..
======================================"
echo ""
