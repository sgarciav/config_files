#!/bin/bash

# Author: Sergio Garcia-Vergara
# Given a filename as input, script updates file from
# original location.

function usage
{
	echo "source updateFile <filename>"
	echo ""
	echo "NOTE: If config file starts with '.', need to save it without it."
	echo "The script will take care of the rest."
	echo ""
}

function update_bashaliases
{
	rm ../bash_aliases
	cp ~/.bash_aliases ../bash_aliases
}


# remove starting '.' if necessary
filename="$1"
if [ ${filename:0:1} == "." ]; then
	filename="$(echo $filename | cut -c 2-)"
fi

# make sure that there is an input
if [ $# -eq 0 ]; then
	usage
# if file does not exists
elif [ ! -f ../$filename ]; then
	echo "$filename: No such file in repo yet. You may want to add it first."
	echo ""
else
	echo "Updating $filename..."
	
	# update depending on input filename
	if [ $filename == "bash_aliases" ]; then
		update_bashaliases
	fi
	
	echo "Updating $filename... Complete"
fi
