#!/bin/sh

FILE='sicp.info.gz'
INFO_DIR='/usr/share/info/dir'

cd ../tmp
if [ ! -e $FILE ]; then
  wget 'http://www.neilvandyke.org/sicp-texi/sicp.info.gz'
fi
gunzip $FILE
sudo install-info --dir-file=$INFO_DIR sicp.info
