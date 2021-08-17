#!/usr/bin/env bash
set -x

./configure --with-gssapi-impl=mit --prefix=$PREFIX
make -j${CPU_COUNT}

# Attempt to fix some file number limits on testing on osx.
if [[ ${target_platform} == osx-* ]]; then
    sudo sysctl -w kern.maxfiles=64000
    sudo sysctl -w kern.maxfilesperproc=64000
    sudo launchctl limit maxfiles 64000 64000
    ulimit -n 64000;
fi

make check || (cat digest-md5/test-suite.log && exit 1)
make install
