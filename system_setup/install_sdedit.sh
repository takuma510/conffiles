#!/bin/sh

echo "install Quick Sequence Diagram Editor"

SRC_FILE=sdedit-4.0-RC1.jar
SRC_FILE_URL=http://sourceforge.net/projects/sdedit/files/sdedit/4.0/${SRC_FILE}/download

INSTALL_DIR=~/src/java

if [ ! -d $INSTALL_DIR ]; then
  mkdir $INSTALL_DIR
  echo "create $INSTALL_DIR"
fi

cd ${INSTALL_DIR}
wget -O $SRC_FILE $SRC_FILE_URL

echo "done... \^_^/"
