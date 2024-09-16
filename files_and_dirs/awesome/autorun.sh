#!/usr/bin/env bash

function run {
  if ! pgrep -f $1 ;
  then
    $@&
  fi
}

run autorandr --load atdc
# Ex: xrandr --output HDMI-2 --left-of eDP-1

run volumeicon

run discord

run xscreensaver -no-splash

run compton
