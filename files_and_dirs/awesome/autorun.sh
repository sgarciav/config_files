#!/usr/bin/env bash

function run {
  if ! pgrep -f $1 ;
  then
    $@&
  fi


run autorandr --load atdc # Options: atdc, home

# run volumeicon

run xscreensaver -no-splash # F12

run compton # enable transparency

run nm-applet # allows for wifi password popup

# Programs
run discord

run google-chrome
