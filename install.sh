#!/bin/bash

brew install neovim/neovim/neovim
brew install fasd
brew install git
brew install zsh
brew install direnv
brew install autoenv
brew install choppsv1/term24/tmux  # 24-bit color version
brew install wget
brew install reattach-to-user-namespace
brew install the_silver_searcher
brew install autojump

if [ ! -d ~/.dotfiles/dependencies/fonts ]; then
  echo "Setting up patched Powerline fonts..."
  git clone git@github.com:powerline/fonts.git ~/.dotfiles/dependencies/fonts
  ~/.dotfiles/dependencies/fonts/install.sh
fi

if [ ! -f ~/.gitconfig.user ]; then
  printf "What is your GitHub username? > "
  read github_user
  git config -f ~/.gitconfig.user github.user "$github_user"

  printf "What is your git name? > "
  read git_name
  git config -f ~/.gitconfig.user user.name "$git_name"

  printf "What is your git email? > "
  read git_email
  git config -f ~/.gitconfig.user user.email "$git_email"
fi

echo "Setting up ZSH..."
if [ ! -f ~/.zshrc ]; then
  ln -s ~/.dotfiles/zshrc ~/.zshrc
fi

if [ ! -d ~/.zsh ]; then
  ln -s ~/.dotfiles/zsh ~/.zsh
fi

echo "Setting up git"
if [ ! -f ~/.gitconfig ]; then
  ln -s ~/.dotfiles/git/gitconfig ~/.gitconfig
fi

if [ ! -f ~/.gitignore ]; then
  ln -s ~/.dotfiles/git/gitignore ~/.gitignore
fi

if [ ! -d ~/.git_template ]; then
  ln -s ~/.dotfiles/git/template ~/.git_template
fi

echo "Setting up pry"
if [ ! -f ~/.pryrc ]; then
  ln -s ~/.dotfiles/irb/pryrc ~/.pryrc
fi

if [ ! -f ~/.unescaped_colors.rb ]; then
  ln -s ~/.dotfiles/irb/unescaped_colors.rb ~/.unescaped_colors.rb
fi

if [ ! -f ~/.escaped_colors.rb ]; then
  ln -s ~/.dotfiles/irb/escaped_colors.rb ~/.escaped_colors.rb
fi

if [ ! -f ~/.aprc ]; then
  ln -s ~/.dotfiles/irb/aprc ~/.aprc
fi

echo "Setting up tmux"
if [ ! -f ~/.tmux.conf ]; then
  ln -s ~/.dotfiles/tmux.conf ~/.tmux.conf
fi

if [ ! -d ~/.tmux ]; then
  ln -s ~/.dotfiles/tmux ~/.tmux
fi

if [ ! -d ~/.tmux/plugins/tpm ]; then
  git clone git@github.com:tmux-plugins/tpm.git ~/.tmux/plugins/tpm
fi

echo "Setting up vimrc"
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

if [ ! -d ~/.config ]; then
  mkdir -p ~/.config
fi

if [ ! -d ~/.config/nvim ]; then
  echo "Setting up Neovim config"
  ln -s ~/.dotfiles/nvim ~/.config/nvim
fi

echo "Installing plugins"
vim +PluginInstall +qall

echo "Installing nvim plugins"
nvim +PlugInstall

cd ~/.vim/bundle/ctrlp-cmatcher
CFLAGS=-Qunused-arguments CPPFLAGS=-Qunused-arguments ./install.sh

cd ~/.local/share/nvim/plugged/ctrlp-cmatcher
CFLAGS=-Qunused-arguments CPPFLAGS=-Qunused-arguments ./install.sh
