#!/bin/sh

TMP_DIR=../tmp
if [ ! -x "`which tss`" ]; then
    cd $TMP_DIR
    git clone git://github.com/clausreinke/typescript-tools.git
    cd typescript-tools/
    npm install -g
fi
