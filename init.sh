#!/usr/bin/env bash

echo "Loading stere dotfiles"

SCRIPT_DIR=$( cd -- "$( dirname -- "${BASH_SOURCE[0]}" )" &> /dev/null && pwd )

function linkFile() {
    FILE=$1

    ln -sf $SCRIPT_DIR/home/$FILE ~/$FILE
}

function addToFile() {
    FILE=$1

    cat $SCRIPT_DIR/home/$FILE >> ~/$FILE
}

linkFile .aliases
linkFile .bashrc
linkFile .hushlogin
addToFile .zshrc
