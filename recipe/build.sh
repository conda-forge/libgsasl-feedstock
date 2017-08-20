#!/usr/bin/env bash

export LDFLAGS=-L$PREFIX/lib 
export CFLAGS=-I$PREFIX/include
./configure --with-gssapi-impl=mit --prefix=$PREFIX
make
make check
make install
