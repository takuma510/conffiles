#!/bin/sh

YASNIPPET=yasnippet-0.6.1c
SOURCE_URL=http://yasnippet.googlecode.com/files/${YASNIPPET}.tar.bz2
SOURCE_FILE=`basename ${SOURCE_URL}`
INSTALL_DIR=~/.emacs.d/manual-install
TMP_DIR=~/.emacs.d/tmp


echo "install yasnippet to ${INSTALL_DIR}..."
cd ${TMP_DIR}
wget ${SOURCE_URL}
tar -xzvf ${SOURCE_FILE} -C ${INSTALL_DIR}
rm ${SOURCE_FILE}


YASNIPPET_CONFIG_URL=http://www.emacswiki.org/emacs/download/yasnippet-config.el
YASNIPPET_CONFIG_FILE=`basename ${YASNIPPET_CONFIG_URL}`

echo "install yasnippet-config.el to ${INSTALL_DIR}..."
wget ${YASNIPPET_CONFIG_URL}
cp ${YASNIPPET_CONFIG_FILE} ${INSTALL_DIR}
rm ${YASNIPPET_CONFIG_FILE}


echo "done... \^_^/"
