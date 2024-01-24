#!/bin/bash

# Author: Sergio Garcia-Vergara
#
# Apply config files on this machine.

function usage()
{
    cat << EOF

usage: ./set_config.sh -s SERVICE -e EMAIL

Apply config files from repository to the current machine. Running this script
will delete current files in machine.

SERVICE (default = all): file or directory to be updated.
   dependencies: install required dependencies with apt-get.
   emacs: files and directories to set EMACS configuration.
   aliases: aliases to be set.
   bashrc: bashrc file.
   terminator: config file for terminator
   git: setup git configuration.
   ssh: setup ssh configuration.
   isolate_workspaces: run the command to isolate workspaces (Ubuntu 18.04).
   install_commit_script: install commit script by copying to ~/.local/bin.

EMAIL (default = sergiodotgarcia@gmail.com): email used to set git and ssh

EOF
}

# variables
EMAIL="sergiodotgarcia@gmail.com"
SERVICE=all

# update variables if there are user inputs
while getopts s:e: flag; do
    case $flag in
	    s)
	        SERVICE=$OPTARG
	        ;;
	    e)
	        EMAIL=$OPTARG
	        ;;
	    ?)
	    usage
	    exit
	    ;;
    esac
done


# user-defined functions
# -------------------------------------

# --------------------
function printNames()
{
    echo "dependencies: uses apt-get"
    echo "emacs: replaces the ~/.emacs.d/ directory"
    echo "aliases: replaces the ~/.bash_aliases file"
    echo "bashrc: replaces the ~/.bashrc file"
    echo "git: setup for git configuration"
    echo "ssh: setup for ssh configuration"
    echo "isolate_workspaces: run the command to isolate workspaces (Ubuntu 18.04)"
    echo "install_commit_script: install commit script by copying to ~/.local/bin"
    echo ""
}

# --------------------
function install_dependencies()
{
    sudo apt-get install -y \
         emacs \
         cmake \
         trash-cli \
         gitk \
         python-pip \
         pass \
         gnome-tweaks \
         openssh-client \
         openssh-server \
         texlive-full \
         biber \
         imagemagick \
         okular \
         auctex \
         openconnect \
         network-manager-openconnect-gnome \
         htop \
         net-tools \
         mlocate \
         redshift \
         redshift-gtk \
         wl-clipboard \
         terminator \
         direnv \
         simplescreenrecorder

    # See: https://askubuntu.com/questions/70784/how-can-i-enable-compose-key
    # gnome-tweak-tool is used to set a "command" key allowing you to type special character
}

# --------------------
function set_emacs()
{
    # delete existing repository
    if [ -d ~/.emacs.d ]; then
	    rm -r ~/.emacs.d
	    echo "Deleting ~/.emacs.d from machine... Complete"
    fi

    # add copy from repo
    cp -r ../files_and_dirs/emacs.d ~/.emacs.d
    echo "Copying ~/.emacs.d to machine... Complete"
}

# --------------------
function set_bashaliases()
{
    # remove file if if exists
    if [ -f ~/.bash_aliases ]; then
	    rm ~/.bash_aliases
	    echo "Deleting ~/.bash_aliases from machine... Complete"
    fi

    # copy repo version to home directory
    cp ../files_and_dirs/bash_aliases ~/.bash_aliases
    echo "Copying ~/.bash_aliases to machine... Complete"
}

# --------------------
function set_bashrc()
{
    echo ""
    echo "WARNING: ~/.bashrc files are sensitive."
    echo "Completing this process will delete your current ~/.bashrc file."
    echo ""

    # ask user
    read -r -p "Are you sure? [y/N] " response
    response=${response,,}    # tolower
    echo " "
    if [[ "$response" =~ ^(yes|y)$ ]]; then
	    rm ~/.bashrc
	    cp ../files_and_dirs/bashrc ~/.bashrc
	    echo "Deleting old and copying new... Complete"
    else
	    echo "Nothing done."
    fi
}

# --------------------
function set_terminator_config()
{
    # create the ~/.config/terminator directory if it doesn't exist
    if [ ! -d ~/.config/terminator ]; then
        mkdir -p ~/.config/terminator
        echo "Creating the ~/.config/terminator directory... Complete"
    fi

    # remove file if if exists
    if [ -f ~/.config/terminator/config ]; then
	    rm ~/.config/terminator/config
	    echo "Deleting ~/.config/terminator/config from machine... Complete"
    fi

    # copy repo version to home directory
    cp ../files_and_dirs/terminator_config ~/.config/terminator/config
    echo "Copying ~/.config/terminator/config to machine... Complete"
}

# --------------------
function setup_git()
{
    # setup personal git-server:
    # https://git-scm.com/book/en/v2/Git-on-the-Server-Setting-Up-the-Server
    git config --global user.name "Sergio Garcia"
    git config --global user.email $EMAIL
}

# --------------------
function setup_ssh()
{
    ssh-keygen -t rsa -b 4096 -C $EMAIL
}

# --------------------
function isolate_workspaces()
{
    gsettings set org.gnome.shell.app-switcher current-workspace-only true
}

# --------------------
function install_commit_script()
{
    cp commit_order.sh ~/.local/bin
}


# main function
# -------------------------------------

if [ $SERVICE = "all" ]; then
    echo "Copying files from:"
    printNames
    install_dependencies
    set_emacs
    set_bashaliases
    set_bashrc
    set_terminator_config
    setup_git
    setup_ssh
    isolate_workspaces
elif [ $SERVICE = "dependencies" ]; then
    install_dependencies
elif [ $SERVICE = "emacs" ]; then
    set_emacs
elif [ $SERVICE = "aliases" ]; then
    set_bashaliases
elif [ $SERVICE = "bashrc" ]; then
    set_bashrc
elif [ $SERVICE = "terminator" ]; then
    set_terminator_config
elif [ $SERVICE = "git" ]; then
    setup_git
elif [ $SERVICE = "ssh" ]; then
    setup_ssh
elif [ $SERVICE = "isolate_workspaces" ]; then
    isolate_workspaces
elif [ $SERVICE = "install_commit_script" ]; then
    install_commit_script
else
    echo "$SERVICE: Not handling this service just yet. Only:"
    echo ""
    printNames
fi
