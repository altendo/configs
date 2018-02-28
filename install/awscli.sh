#!/bin/bash

AWS_DIR="$HOME/.aws/"
PATH_BIN='/usr/local/bin/aws'
PATH_INSTALL='/usr/local/aws'
ZIP='awscli-bundle.zip'
ZIP_DIR='awscli-bundle'

if [ ! -d "$AWS_DIR" ]; then
    mkdir $AWS_DIR
fi

curl "https://s3.amazonaws.com/aws-cli/awscli-bundle.zip" -o "$AWS_DIR/$ZIP"

if [ ! -f "$AWS_DIR/$ZIP" ]; then
    echo "ERROR unable to download $ZIP"
    exit 1;
fi

unzip "$AWS_DIR/$ZIP" -d "$AWS_DIR"

if [ ! -d "$AWS_DIR/$ZIP_DIR" ]; then
    echo "ERROR unable to unzip $ZIP"
    exit 1;
fi

sudo "$AWS_DIR/$ZIP_DIR/install" -i $PATH_INSTALL -b $PATH_BIN

if [ "$?" -eq "0" ]; then
    rm -rf "$AWS_DIR/$ZIP" "$AWS_DIR/$ZIP_DIR" "$AWS_DIR/cli"
    exit 1;
fi
