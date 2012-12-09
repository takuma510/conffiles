#!/bin/sh

ENSIME=ensime_2.9.2-0.9.8.1
SOURCE_URL=https://github.com/downloads/aemoncannon/ensime/${ENSIME}.tar.gz
SOURCE_FILE=`basename ${SOURCE_URL}`
INSTALL_DIR=~/.emacs.d/manual-install
TMP_DIR=~/.emacs.d/tmp

echo "install ENSIME to ${INSTALL_DIR}..."

# download
cd ${TMP_DIR}
wget ${SOURCE_URL}

# install
tar -xzvf ${SOURCE_FILE}
cp -r ${ENSIME} ${INSTALL_DIR}

# cleanup
cd ${TMP_DIR}
rm ${SOURCE_FILE}
rm -fr ${ENSIME}

echo "done... \^_^/"
