#!/bin/bash

# Author: Sergio Garcia-Vergara
# Apply config files on this machine.

# TODO: Verify that it makes sense to update bash_aliases like so.

function usage
{
    echo "usage: source setAllConfigFiles <config file to update>"
    echo ""
    echo "Select <all> to update all."
    echo ""
}

function update_bashaliases
{
    if [ -f ~/.bash_aliases ]; then
	echo "Adding lines to ~/.bash_aliases..."
	tail --lines=+3 ../bash_aliases >> ~/.bash_aliases
	echo "Adding lines to ~/.bash_aliases... Complete"
    else
	echo "Creating ~/.bash_aliases..."
	cp ../bash_aliases ~/.bash_aliases
	echo "Creating ~/.bash_aliases... Complete"
    fi
}

function update_emacs
{
    # delete existing repository
    if [ -d ~/.emacs.d ]; then
	echo "Deleting existing ~/.emacs.d directory..."
	rm -r ~/.emacs.d
    fi

    # add one from repo
    echo "Copying updated .emacs.d folder to home directory..."
    mv ./emacs.d ~/.emacs.d
    echo "Copying updated .emacs.d folder to home directory... Complete"
}

function update_all
{
    update_bashaliases
    update_emacs
}

# -----------------------------------------------

# make sure that there is an input
if [ $# -eq 0 ]; then
    usage
fi

# remove starting '.' if necessary
filename="$1"
if [ ${filename:0:1} == "." ]; then
    filename="$(echo $filename | cut -c 2-)"
fi

# update config file depending on input filename
if [ $filename == "bash_aliases" ]; then
    update_bashaliases
elif [ $filename == "emacs" ]; then
    update_emacs
elif [ $filename == "all" ]; then
    update_all
else
    echo "$filename: Not handling this file just yet..."
fi

