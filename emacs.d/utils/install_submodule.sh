#!/bin/sh

CONFFILES=${HOME}/conffiles
RINARI_PATH=${CONFFILES}/emacs.d/vender/rinari

echo "install gitsubmodule..."

cd ${CONFFILES}
echo "cd dir `pwd`"
git submodule init
git submodule update
cd ${RINARI_PATH}
echo "cd dir `pwd`"
git submodule init
git submodule update

echo "done... \^_^/"
