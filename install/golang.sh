#!/bin/bash

VERSION=$(curl -s "https://golang.org/dl/" | \
          grep -Po "go\d+\.\d+(\.\d+)?" | \
          uniq | sort -V | tail -n 1)

ARCH='linux-amd64'
EXT='tar.gz'
FILE="${VERSION}.${ARCH}.${EXT}"

curl -o $FILE -s "https://storage.googleapis.com/golang/$FILE" && tar zxf $FILE && rm -rf $FILE

if [ -d "$GOROOT" ]; then
    mv go $GOROOT.bak
fi

sudo mv go $GOROOT
rm -rf $GOROOT.bak
