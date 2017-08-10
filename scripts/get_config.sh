#!/bin/bash

# Author: Sergio Garcia-Vergara
#
# Update config files in repository. Will delete currents files in repository.

function usage()
{
    cat << EOF

usage: ./get_config.sh -s SERVICE

Update config files in repository. Running this script will delete current files
in the repository.

SERVICE (default = all): file or directory to be updated.
   emacs: files and directories to set EMACS configuration.
   aliases: aliases to be set.

EOF
}


# variables
SERVICE=all

# update variables if there are user inputs
while getopts s: flag; do
    case $flag in
	s)
	    SERVICE=$OPTARG
	    ;;
	?)
	usage;
	exit;
	;;
    esac
done


# user-defined functions
# -------------------------------------

# --------------------
function printNames()
{
    echo "~/.bash_aliases"
    echo "~/.emacs.d/"
    echo ""
}

# --------------------
function get_bashaliases()
{
    if [ -f ~/.bash_aliases ]; then
	rm ../bash_aliases
	cp ~/.bash_aliases ../bash_aliases
	echo "Copying ~/.bash_aliases from machine to repo... Complete"
    else
	echo "~/.bash_aliases does NOT exist in current machine."
    fi
}

# --------------------
function get_emacs()
{
    if [ -d ~/.emacs.d ]; then
	rm -r ../emacs.d
	cp -r ~/.emacs.d ../emacs.d
	echo "Copying ~/.emacs.d from machine to repo... Complete"
    else
	echo "~/.emacs.d does NOT exist in current machine."
    fi

    # delete 'emacs_backup' directory
    rm -rf ../emacs.d/emacs-backup/
}



# main function
# -------------------------------------

if [ $SERVICE = "all" ]; then
    echo "Copying files from:"
    printNames
    get_emacs
    get_bashaliases
elif [ $SERVICE = "emacs" ]; then
    get_emacs
elif [ $SERVICE = "aliases" ]; then
    get_bashaliases
else
    echo "$SERVICE: Not handling this service just yet. Only:"
    printNames
fi
