echo "
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
echo "
======================================
Now type 'exit' & restart Termux
======================================"
echo ""
