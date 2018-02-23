#!/bin/bash

AWS_DIR='~/.aws'
INSTALL_DIR='awscli-bundle'
PATH_BIN='/usr/local/bin/aws'
PATH_INSTALL='/usr/local/aws'
ZIP='awscli-bundle.zip'

if [ ! -d "$AWS_DIR" ]; then
    mkdir $AWS_DIR
fi

cd $AWS_DIR

curl "https://s3.amazonaws.com/aws-cli/awscli-bundle.zip" -o $ZIP

if [ ! -f "$ZIP" ]; then
    echo "ERROR unable to download $ZIP"
fi

unzip $ZIP

if [ ! -f "$INSTALL_DIR" ]; then
    echo "ERROR unable to unzip $ZIP"
fi

sudo ./$INSTALL_DIR/install -i $PATH_INSTALL -b $PATH_BIN

