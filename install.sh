#!/usr/bin/env bash

installers="${BASH_SOURCE%/*}/installers"

$installers/homebrew
$installers/git
$installers/devtools
$installers/zsh
$installers/ruby
$installers/tmux
$installers/fonts

brew install neovim/neovim/neovim --HEAD
brew install pyenv
brew install --HEAD pyenv-virtualenv

export PYTHON_CONFIGURE_OPTS="--enable-framework"

eval "$(pyenv init -)"
eval "$(pyenv virtualenv-init -)"

pyenv install -s 2.7.13
pyenv install -s 3.6.2
pyenv global 3.6.2

if [ ! -d $(pyenv root)/plugins/pyenv-virtualenv ]; then
  git clone https://github.com/yyuu/pyenv-virtualenv.git \
    $(pyenv root)/plugins/pyenv-virtualenv
fi

if ! pyenv virtualenvs | grep -r py2neovim; then
  pyenv virtualenv 2.7.13 py2neovim
fi

if ! pyenv virtualenvs | grep -q py3neovim; then
  pyenv virtualenv 3.6.2 py3neovim
fi

pyenv activate py2neovim
pip install neovim

pyenv activate py3neovim
pip install neovim


if [ ! -d ~/.config ]; then
  mkdir -p ~/.config
fi

if [ ! -d ~/.config/nvim ]; then
  echo "Setting up Neovim config"
  ln -s ~/.dotfiles/nvim ~/.config/nvim
fi

echo "Installing nvim plugins"
nvim +PlugInstall
