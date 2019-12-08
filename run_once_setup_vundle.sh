#!/bin/sh
mkdir -p ~/.vim/bundle/

if [ ! -e ~/.vim/bundle/Vundle.vim ]; then
  git clone https://github.com/VundleVim/Vundle.vim.git ~/.vim/bundle/Vundle.vim
else
  git pull ~/.vim/bundle/Vundle.vim
fi

vim +BundleInstall +qall
