#!/bin/bash

# Author: Sergio Garcia-Vergara
# Given a filename as input, script updates file from
# original location.

function usage
{
    echo "usage: source updateFile <filename>"
    echo "Updates file from original location."
    echo ""
    echo "NOTE: If config file starts with '.', need to save it without it."
    echo "The script will take care of the rest."
    echo ""
    echo "Select <all> to update all."
    echo ""
}

function update_bashaliases
{
    rm ../bash_aliases
    cp ~/.bash_aliases ../bash_aliases
}

function update_emacs
{
    rm -r ../emacs.d
    cp -r ~/.emacs.d ../emacs.d
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
    exit
fi

# remove starting '.' if necessary
filename="$1"
if [ ${filename:0:1} == "." ]; then
    filename="$(echo $filename | cut -c 2-)"
fi

# perform action depending on input
if [ $filename == "all" ]; then
    update_all
elif    [ ! -f ../$filename ] && [ ! -d ../$filename ]; then
    echo "$filename: No such file in repo yet. You may want to add it first."
    echo ""
else
    echo "Updating $filename..."
    
    # update depending on input filename
    if [ $filename == "bash_aliases" ]; then
	update_bashaliases
    elif [ $filename == "emacs.d" ]; then
	update_emacs
    fi
    
    echo "Updating $filename... Complete"
fi
