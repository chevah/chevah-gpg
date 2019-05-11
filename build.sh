# Build from source for Linux.
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
cp g10/gpg ../build/
make distclean

# Copy the Windows files.
cd ../
cp gnupg-win/gpg.exe build/
cp gnupg-win/iconv.dll build/
