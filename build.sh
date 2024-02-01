# Build from source for Linux.
mkdir -p build
cd gnupg
make clean
./configure \
    --disable-dns-cert \
    --disable-dns-srv \
    --disable-ldap \
    --disable-card-support \
    --disable-agent-support \
    --enable-camellia \
    --disable-exec \
    --disable-bzip2 \
    --disable-photo-viewers \
    --disable-keyserver-helpers \
    --disable-hkp \
    --disable-finger \
    --disable-generic \
    --disable-mailto \
    --disable-keyserver-path \
    --disable-nls \
    --disable-threads \
    --disable-regex \
    --enable-noexecstack
make
os_name=`uname -s`

if [ "$os_name" = "Linux" ]
then
    # FIXME:
    # On ARM64 this should be renamed to gpg1-linux-arm64
    cp g10/gpg ../build/gpg1-linux-x64
elif [ "$os_name" = "Darwin" ]
then
    cp g10/gpg ../build/gpg1-macos
else
    echo 'OS not supported:' $os_name
    exit 1
fi

make distclean

# Copy the Windows files.
cd ../
cp gnupg-win/gpg.exe chevah/chevah_gpg/gpg1.exe
cp gnupg-win/iconv.dll chevah/chevah_gpg/
