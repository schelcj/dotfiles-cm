#!/bin/sh

if [ -e ~/.config/pianobar ]; then
  CTL="$HOME/.config/pianobar/ctl"
  if [ ! -p  $CTL ]; then
    mkfifo $CTL
  fi
fi
