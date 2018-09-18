#!/bin/bash

echo "checking install of bcmwl-kernel-source..."
echo " "

dpkg -s bcmwl-kernel-source

echo "checking that wl module is loaded..."
echo " "

lsmod | grep wl

echo " "
echo "Please reboot and test the installation."
