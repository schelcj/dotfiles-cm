#!/bin/sh
CTL="$HOME/.config/pianobar/ctl"
if [ ! -p  $CTL ]; then
  mkfifo $CTL
fi
