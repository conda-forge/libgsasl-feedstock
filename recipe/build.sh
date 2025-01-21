#!/usr/bin/env bash

set -o xtrace -o nounset -o pipefail -o errexit

./configure --with-gssapi-impl=mit --enable-static=no --prefix=$PREFIX
make
make check
make install
