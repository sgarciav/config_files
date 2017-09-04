#!/bin/bash

# Author: Sergio Garcia-Vergara
#
# Setup Ubuntu configuration first time you use it.

function usage()
{
    cat << EOF

usage: ./first_config.sh

Setup Ubuntu configuration first time you use it.

EOF
}



# user-defined functions
# -------------------------------------

# --------------------
function install_dependencies()
{
    sudo apt-get install -y emacs
}

# --------------------
function setup_git()
{
    git config --global user.name "Sergio Garcia"
    git config --global user.email "sergiodotgarcia@gmail.com"
}

# --------------------
function setup_ssh()
{
    echo "ssh: in progredss"
}

# main function
# -------------------------------------

install_dependencies
setup_git
setup_ssh
