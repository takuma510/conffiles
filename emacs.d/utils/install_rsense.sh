#!/bin/sh

RSENSE=rsense-0.3
SOURCE_URL=http://cx4a.org/pub/rsense/${RSENSE}.tar.bz2
SOURCE_FILE=`basename ${SOURCE_URL}`
TMP_DIR=~/.emacs.d/tmp
INSTALL_DIR=~/.emacs.d/manual-install


echo "install rsense to ${INSTALL_DIR}..."

cd ${TMP_DIR}
wget ${SOURCE_URL}
tar -zxvf ${SOURCE_FILE} -C ${INSTALL_DIR}
rm ${SOURCE_FILE}

cd ${INSTALL_DIR}/${RSENSE}
chmod +x bin/rsense
ruby etc/config.rb > ~/.rsense

echo "done... \^_^/"
