#!/bin/sh

if [ -e ~/.configi3 ]; then
  cd ~/.config/i3
  make
fi
