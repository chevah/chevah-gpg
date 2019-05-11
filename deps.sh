#!/bin/sh
# Get depenencieds for building the project
VERSION=1.4.23
rm -rf gnupg
rm -rf gnupg-win
mkdir -p build
cd build

# Get source code.
rm -rf gnupg-$VERSION.tar.bz2
wget https://www.gnupg.org/ftp/gcrypt/gnupg/gnupg-$VERSION.tar.bz2
tar -xjf gnupg-$VERSION.tar.bz2
mv gnupg-$VERSION ../gnupg

# Get Windows compiled files.
rm -rf gnupg-w32cli-$VERSION.exe
wget https://www.gnupg.org/ftp/gcrypt/binary/gnupg-w32cli-$VERSION.exe
file-roller -h gnupg-w32cli-$VERSION.exe
mv gnupg-w32cli-$VERSION ../gnupg-win
rm -rf '../gnupg-win/$PLUGINSDIR/'
