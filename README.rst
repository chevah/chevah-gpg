Chevah GnuPG distribution
=========================


Build the Python Package
------------------------

The Python package contains for now the Linux and Windows Executable.

    $ ./build.sh
    $ python setup.py publish


Update GnuGPG
-------------

This repo contains a copy of the GnuPG code, to reduce dependencies.
It also contains a copy of the GnuPG Windows compiled files.

Modify and call `./deps.sh` to get an updated GnuPG code.

Commit the updated code to this repo.
