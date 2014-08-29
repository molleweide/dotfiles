#!/bin/bash

echo "Setting GitHub user to dbalatero"
git config --global github.user dbalatero

if [ ! -f ~/.vimrc ]; then
  ln -s ~/.dotfiles/vimrc ~/.vimrc
fi

if [ ! -d ~/.vim ]; then
  ln -s ~/.dotfiles/vim ~/.vim
fi

if [ ! -d ~/.vim/bundle/vundle ]; then
  echo "Cloning Vundle to ~/.vim"
  git clone https://github.com/gmarik/vundle.git ~/.vim/bundle/vundle
fi

echo "Installing plugins"
vim +PluginInstall +qall

cd ~/.vim/bundle/ctrlp-cmatcher
CFLAGS=-Qunused-arguments CPPFLAGS=-Qunused-arguments ./install.sh

brew install ctags
