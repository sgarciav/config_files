#!/bin/bash

# Author: Sergio Garcia-Vergara
# get_config.sh
# Update config files in repository.

function usage
{
    echo ""
    echo "usage: source get_config.sh <directory or filename>"
    echo "Update config files in repository."
    echo ""
    echo "NOTE: If config file starts with '.', need to save it without it."
    echo "The script will take care of the rest."
    echo ""
}

function printNames
{
    echo "~/.bash_aliases"
    echo "~/.emacs.d/"
    echo ""
}

function progress_msg
{
    if [ $1 -eq 0 ]; then
	usage
	echo "$2: does not exist in current machine."
    elif [ $1 -eq 1 ]; then
	echo "Copying $2 from machine to repo... Complete"
	echo ""
    fi
}

function get_bashaliases
{
    if [ -f ~/.bash_aliases ]; then
	rm ../bash_aliases
	cp ~/.bash_aliases ../bash_aliases
	progress_msg 1 $1
    else
	progress_msg 0 $1
    fi
}

function get_emacs
{
    if [ -d ~/.emacs.d ]; then
	rm -r ../emacs.d
	cp -r ~/.emacs.d ../emacs.d
	progress_msg 1 $1
    else
	progress_msg 0 $1
    fi

    # delete 'emacs_backup' directory
    rm -rf ../emacs.d/emacs-backup/
}

function get_all
{
    echo "Updating all config files..."
    printNames
    get_bashaliases "~/.bash_aliases"
    get_emacs "~/.emacs.d/"
    echo "Updating all config files... Complete"
    echo ""
}

# -----------------------------------------------

# make sure that there is an input
if [ $# -ne 1 ] ||  [ $1 == "-u" ] || [ $1 == "-usage" ]; then
    usage
elif [ $1 == "bash_aliases" ]; then
    get_bashaliases $1
elif [ $1 == "emacs" ]; then
    get_emacs $1
elif [ $1 == "all" ]; then
    get_all
else
    echo "$1: Not handling this file just yet. Only:"
    printNames
fi
