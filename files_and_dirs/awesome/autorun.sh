#!/usr/bin/env bash

function run {
  if ! pgrep -f $1 ;
  then
    $@&
  fi
}

run autorandr --load atdc
# Ex: xrandr --output HDMI-2 --left-of eDP-1

# run volumeicon

run xscreensaver -no-splash # F12

run compton # enable transparency

# Programs
run discord

run Firefox

run google-chrome
