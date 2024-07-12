#!/usr/bin/env bash

PNUM=
PNAME=
PLANG=

_get_name(){
    echo "insert number"
    read PNUM
    echo "insert NameOfProblem"
    read PNAME
    echo "insert extension, ex: .py"
    echo "make sure to have code in clipboard"
    read PLANG
}

_paste(){
    if (uname="Darwin") then
        pbpaste > $FILE
    else
        # xclip -selection clipboard -o > to file
        echo "linux"
    fi
}

_main(){
    _get_name
    FOLDER="${PNUM}_${PNAME}"
    FILE="${PNUM}.${PLANG}"

    mkdir $FOLDER
    (cd $FOLDER && _paste)
    (date -I > "$FOLDER/notes.txt")
}

_main
