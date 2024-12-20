#!/usr/bin/env bash
set -x

./configure --with-gssapi-impl=mit --enable-static=no --prefix=$PREFIX
make
make check
make install
