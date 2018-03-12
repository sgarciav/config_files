#!/bin/bash

# Author: Sergio Garcia-Vergara
#
# For a given brancg, determine which commit came first. Note that
# this script will only work for commits in the same history line.

function usage()
{
    cat << EOF

usage: ./commit_order <SHA1> <SHA2>

For a given brancg, determine which commit came first. Note that
this script will only work for commits in the same history line.

EOF
}

# variables
SHA1=0
SHA2=0

# update variables if there are user inputs
while getopts h: flag; do
    case $flag in
	    h)
	    # UAVID=$OPTARG
            usage
	        ;;
	    ?)
	    usage
	    exit
	    ;;
    esac
done


# main function
# -------------------------------------

# store inputs in variables
SHA1=$1
SHA2=$2

# get result
git merge-base --is-ancestor $SHA1 $SHA2
RESULT=$?

# display result
if [ $RESULT -eq 1 ]; then
    echo "$SHA2 was commited first"
elif [ $RESULT -eq 0 ]; then
    echo "$SHA1 was commited first"
else
    echo "Result: $RESULT"
    echo "ERROR: Oops. Something went wrong"
fi
