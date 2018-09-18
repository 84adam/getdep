#!/bin/bash 

DEBS="$(ls | grep .deb)"

for i in $DEBS; do sudo dpkg -i $i; done

sleep 3

echo "Trying again for good measure..."
echo " "

for i in $DEBS; do sudo dpkg -i $i; done
