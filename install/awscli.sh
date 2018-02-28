#!/bin/bash

AWS_DIR="$HOME/.aws/"
PATH_BIN='/usr/local/bin/aws'
PATH_INSTALL='/usr/local/aws'
ZIP='awscli-bundle.zip'
ZIP_DIR='awscli-bundle'

if [ ! -d "$AWS_DIR" ]; then
    mkdir $AWS_DIR
fi

cd $AWS_DIR

curl "https://s3.amazonaws.com/aws-cli/awscli-bundle.zip" -o $ZIP

if [ ! -f "$ZIP" ]; then
    echo "ERROR unable to download $ZIP"
fi

unzip $ZIP

if [ ! -f "$ZIP_DIR" ]; then
    echo "ERROR unable to unzip $ZIP"
fi

sudo ./$ZIP_DIR/install -i $PATH_INSTALL -b $PATH_BIN

if [ "$?" -eq "0" ]; then
    rm -rf $ZIP $ZIP_DIR cli
fi
