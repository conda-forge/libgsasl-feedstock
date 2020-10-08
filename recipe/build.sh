#!/usr/bin/env bash
set -x

./configure --with-gssapi-impl=mit --prefix=$PREFIX
make -j${CPU_COUNT}
make check || (cat digest-md5/test-suite.log && exit 1)
make install
