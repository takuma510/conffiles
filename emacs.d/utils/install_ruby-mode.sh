#!/bin/sh

INSTALL_DIR=$1

# rvmを前提にしているので注意
SOURCE_DIR=`which ruby | sed "s/rubies/src/g" | sed "s/bin\/ruby/misc/g"`

echo "install ruby-mode from ${SOURCE_DIR} to ${INSTALL_DIR}"

cp ${SOURCE_DIR}/*.el ${INSTALL_DIR}

echo "done... ^_^"