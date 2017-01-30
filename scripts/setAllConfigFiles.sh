#!/bin/bash

# Author: Sergio Garcia-Vergara
# Setus up all configuration files in the repository.

function usage
{
	echo "source setAllConfigFiles"
	echo ""
}

function exists
{
	echo "$1 exists. Appending to existing file..."
	echo ""
}

function not_exists
{
	echo "$1 does NOT exist. Copying complete file..."
	echo ""
}

# setup bash aliases
if [ -f ~/.bash_aliases ]; then
	exists ~/.bash_aliases
	tail --lines=+3 ../bash_aliases >> ~/.bash_aliases
else
	not_exists ~/.bash_aliases
	cp ../bash_aliases ~/.bash_aliases
fi
