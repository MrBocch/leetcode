#!/usr/bin/env bash

PNUM=
PNAME=
PLANG=

_get_name(){
    echo "insert number"
    read PNUM
    echo

    echo "insert NameOfProblem"
    read PNAME
    echo

    echo "insert extension, ex: [py | rb | hs | rs]"
    echo "make sure to have code in clipboard"
    read PLANG
    echo
}

_paste(){
    if (uname="Darwin") then
        pbpaste > $FILE
    else
        xclip -selection clipboard -o > $FILE
        # echo "linux"
    fi
}

_main(){
    while TRUE; do
        echo "(1) Solved a new problem"
        echo "(2) Solved a old problem in different lang"
        echo "(3) Push to github"
        echo "(4) Exit"
        read c

        case $c in
            1)
                ;;
            2)
                ;;
            3)
                git add .
                git commit
                git push
                ;;
            4)
                exit
                ;;
            *)
                echo "what?"
                ;;
        esac
    done
    _get_name
    FOLDER="${PNUM}_${PNAME}"
    FILE="${PNUM}.${PLANG}"

    mkdir $FOLDER
    (cd $FOLDER && _paste)
    date -I > "$FOLDER/notes.txt"
}

echo "
====================
= LEETCODE MANAGER =
====================
"
_main
