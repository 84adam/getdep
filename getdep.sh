#!/bin/bash

TARGET="bcmwl-kernel-source"

LST_1="$TARGET $(apt-cache depends $TARGET | grep Depends: | awk '{print$2}')"

LST_2="$LST_1 $(for i in $LST_1; do apt-cache depends $i | grep Depends: | awk '{print$2}'; done)"

echo "Getting URLs for: "
echo "$LST_2"

DIRS="DEB_FILES"
mkdir -p ./$DIRS

for i in $LST_2; do apt-get --print-uris --yes -d --reinstall install $i | grep "http://" | awk '{print$1}' | xargs -I'{}' echo {} >> ./$DIRS/files.list ; done

UNIQUE="$(sort -u ./$DIRS/files.list)"
COUNT="$(cat ./$DIRS/files.list | wc -l)"
DIRS="DEB_FILES"
TARB="DEB_FILES.tar.gz"

echo "Downloading $COUNT required files to $DIRS'."

for i in $UNIQUE; do wget $i -P ./$DIRS/; done

cp ./check_install.sh $DIRS/
cp ./install_all.sh $DIRS/

echo "Downloads complete. Creating tarball..."

tar cvzf $TARB $DIRS/

echo "Tarball ready. Copy to your machine, extract, make executable & run 'sudo ./install_all.sh'"
