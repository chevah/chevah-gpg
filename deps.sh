#!/bin/sh
# Get depenencieds for building the project
VERSION=1.4.23
rm -rf gnupg
rm -rf gnupg-win
mkdir -p build
cd build

# Get source code.
rm -rf gnupg.tar.bz2
curl -v -o gnupg.tar.bz2 \
    https://www.gnupg.org/ftp/gcrypt/gnupg/gnupg-$VERSION.tar.bz2
tar -xjf gnupg.tar.bz2
mv gnupg-$VERSION ../gnupg
cd ../gnupg
wget -O https://sources.debian.org/data/main/g/gnupg1/1.4.23-1.1/debian/patches/0006-fix-for-gcc10.patch
git apply 0006-fix-for-gcc10.patch

# Get Windows compiled files.
rm -rf gnupg-w32cli.exe
curl -v -o gnupg-w32cli.exe \
    https://www.gnupg.org/ftp/gcrypt/binary/gnupg-w32cli-$VERSION.exe
7z x gnupg-w32cli.exe -ognupg-w32cli
mv gnupg-w32cli ../gnupg-win
rm -rf '../gnupg-win/$PLUGINSDIR/'
