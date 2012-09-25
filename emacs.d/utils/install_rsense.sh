#!/bin/sh

RSENSE=rsense-0.3
SOURCE_URL=http://cx4a.org/pub/rsense/${RSENSE}.tar.bz2
TMP_DIR=~/.emacs.d/tmp
INSTALL_DIR=~/.emacs.d/manual-install


echo "install rsense to ${INSTALL_DIR}..."

cd ${TMP_DIR}
wget ${SOURCE_URL}
tar -zxvf `basename ${SOURCE_URL}` -C ${INSTALL_DIR}
cd ${INSTALL_DIR}/${RSENSE}
chmod +x bin/rsense
ruby etc/config.rb > ~/.rsense

echo "done... \^_^/"
