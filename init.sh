#!/usr/bin/env bash

echo -e "Loading steru dotfiles\n"

SCRIPT_DIR=$( cd -- "$( dirname -- "${BASH_SOURCE[0]}" )" &> /dev/null && pwd )

function linkFile() {
    FILE=$1

    ln -sf $SCRIPT_DIR/home/$FILE ~/$FILE
}

function addToFile() {
    FILE=$1

    FILE_PATH=$SCRIPT_DIR/home/$FILE
    FILE_HOME_PATH=~/$FILE
    FILE_VALUE=`cat $FILE_PATH`

    CONTAINS=`cat $FILE_HOME_PATH | grep -q "$FILE_VALUE"; echo $?`

    if [ "$CONTAINS" -eq "0" ]; then
        echo "Allready loaded $FILE"
    else
        cat $FILE_PATH >> $FILE_HOME_PATH
    fi
}

linkFile .aliases
linkFile .bashrc
linkFile .hushlogin
linkFile .tmux.conf
addToFile .zshrc

echo -e '\nDone'
