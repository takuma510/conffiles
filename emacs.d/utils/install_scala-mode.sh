#!/bin/sh

SOURCE_URL=https://github.com/scala/scala-dist/archive/master.tar.gz
SOURCE_FILE=`basename ${SOURCE_URL}`
INSTALL_DIR=~/.emacs.d/manual-install
TMP_DIR=~/.emacs.d/tmp
MASTER_SOURCE_DIR=scala-dist-master
EMACS_LISP_SOURCE_DIR=${MASTER_SOURCE_DIR}/tool-support/src/emacs

echo "install scala-mode elisp to ${INSTALL_DIR}..."

# download
cd ${TMP_DIR}
wget ${SOURCE_URL}
tar -xzvf ${SOURCE_FILE}

# install
cd ${EMACS_LISP_SOURCE_DIR}
cp *.el ${INSTALL_DIR}

# cleanup
cd ${TMP_DIR}
rm ${SOURCE_FILE}
rm -fr ${MASTER_SOURCE_DIR}

echo "done... \^_^/"
