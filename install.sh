#!/bin/bash

function die() {
    echo $1
    rm -f authorized_keys
    exit 1
}

mkdir -p ~/.ssh
cat ssh/* > authorized_keys
chmod 600 authorized_keys
diff --unidirectional-new-file ~/.ssh/authorized_keys authorized_keys && die "All keys already installed"
read -p "Are you sure? [Y/n] " -n 1 -r
echo # newline
if [[ $REPLY =~ ^[Yy]$ ]]
then
    mv authorized_keys ~/.ssh/authorized_keys
else
    rm -f authorized_keys
fi
