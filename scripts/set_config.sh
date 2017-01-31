#!/bin/bash

# Author: Sergio Garcia-Vergara
# set_config.sh
# Apply config files on this machine.

function usage
{
    echo ""
    echo "usage: source set_config.sh <directory or filename>"
    echo "Apply config files -taken from repo-  on this machine."
    echo ""
}

function progress_msg
{
    if [ $1 == "copy" ]; then
	echo "Copying $2 from repo to machine... Complete"
    elif [ $1 == "delete" ]; then
	echo "Deleting existing $2 in machine... Complete"
    fi
    echo ""
}

function printNames
{
    echo "~/.bash_aliases"
    echo "~/.emacs.d/"
    echo ""
}

function set_bashaliases
{
    # remove file if if exists
    if [ -f ~/.bash_aliases ]; then
	rm ~/.bash_aliases
	progress_msg "delete" $1
    fi

    # copy repo version to home directory
    cp ../bash_aliases ~/.bash_aliases
    progress_msg "copy" $1
}

function set_emacs
{
    # delete existing repository
    if [ -d ~/.emacs.d ]; then
	rm -r ~/.emacs.d
	progress_msg "delete" $1
    fi

    # add copy from repo
    cp -r ../emacs.d ~/.emacs.d
    progress_msg "copy" $1
}

function set_all
{
    echo "Updating all config files..."
    printNames
    set_bashaliases "~/.bash_aliases"
    set_emacs "~/.emacs.d/"
    echo "Updating all config files... Complete"
    echo ""
}

# -----------------------------------------------

# make sure that there is an input
if [ $# -ne 1 ] ||  [ $1 == "-u" ] || [ $1 == "-usage" ]; then
    usage
elif [ $1 == "bash_aliases" ]; then
    set_bashaliases $1
elif [ $1 == "emacs" ]; then
    set_emacs $1
elif [ $1 == "all" ]; then
    set_all
else
    echo "$1: Not handling this file just yet. Only:"
    printNames
fi

