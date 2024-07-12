#!/usr/bin/env bash

PNUM=
PNAME=
PLANG=

_get_num(){
    echo "insert number"
    read PNUM
    echo
}

_get_name() {
    echo "insert name"
    read PNAME
    echo
}

_get_lang(){
    echo "insert extension, ex: [py | rb | hs | rs]"
    echo "make sure to have code in clipboard"
    read PLANG
    echo
}

_search(){
    ls -d $1_* 2>/dev/null
}

_paste(){
    if (uname="Darwin") then
        pbpaste > $FILE
    else
        xclip -selection clipboard -o > $FILE
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
                _get_num
                _get_name
                _get_lang
                FOLDER="${PNUM}_${PNAME}"
                FILE="${PNUM}.${PLANG}"
                mkdir $FOLDER
                (cd $FOLDER && _paste)
                date -I > "$FOLDER/notes.txt"
                ;;
            2)
                _get_num
                FOLDER=$(_search $PNUM)
                if [ -z $FOLDER ]; then
                    echo "No such problem"
                else
                    echo "make sure not to overwrite"
                    (cd $FOLDER && ls)
                    _get_name
                    _get_lang
                    # how to prevent overwriting file?
                    FILE="${PNAME}.${PLANG}"
                    (cd $FOLDER && _paste)
                fi
                ;;
            3)
                git pull
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
}

echo "
====================
= LEETCODE MANAGER =
====================
"
_main
