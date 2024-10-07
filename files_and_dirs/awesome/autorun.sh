#!/usr/bin/env bash

# FILEPATH="~/.config/awesome/Running-on-${date}.txt"
# echo "Hello! I'm running the following programs:" >> FILEPATH
# echo " " >> FILEPATH

function run
{
    if ! pgrep -f $1 ; then
        $@&
        # echo "$@" >> FILEPATH
    fi
}

run autorandr --load atdc # Options: atdc, home

# run volumeicon

run xscreensaver -no-splash # F12

run compton # enable transparency

run nm-applet # allows for wifi password popup

# Programs
run discord

run google-chrome
