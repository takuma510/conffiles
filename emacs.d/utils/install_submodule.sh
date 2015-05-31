#!/bin/sh

CONFFILES=${HOME}/conffiles

echo "install gitsubmodule..."

cd ${CONFFILES}
echo "cd dir `pwd`"
git submodule init
git submodule update

echo "done... \^_^/"
