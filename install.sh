#!/bin/bash

brew install getantibody/tap/antibody
brew install neovim/neovim/neovim --HEAD
brew install fasd
brew install phantomjs
brew install git
brew install sl
brew install zsh
brew install zplug
brew install direnv
brew install autoenv
brew install tmux
brew install wget
brew install reattach-to-user-namespace
brew install the_silver_searcher
brew install autojump
brew install pyenv
brew install --HEAD pyenv-virtualenv
brew install fzf
brew install ctags

if [ ! -f $HOME/.fzf.zsh ]; then
  /usr/local/opt/fzf/install
fi

brew tap caskroom/fonts
brew cask install font-hack-nerd-font

export PYTHON_CONFIGURE_OPTS="--enable-framework"

eval "$(pyenv init -)"
eval "$(pyenv virtualenv-init -)"

pyenv install -s 2.7.13
pyenv install -s 3.6.2
pyenv global 3.6.2

if [ ! -d ~/Library/Application\ Support/Übersicht/widgets ]; then
  mkdir -p ~/Library/Application\ Support/Übersicht

  ln -sf ~/.dotfiles/Ubersicht/widgets \
    ~/Library/Application\ Support/Übersicht/widgets
fi

if [ ! -d ~/.config/base16-shell ]; then
  git clone git clone https://github.com/chriskempson/base16-shell.git \
    ~/.config/base16-shell
fi

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

if [ ! -L ~/.rvm/hooks/after_install_add_default_gems ]; then
  echo "Symlinking hooks to RVM"
  mkdir -p ~/.rvm/hooks
  ln -s ~/.dotfiles/rvm/hooks/after_install_add_default_gems ~/.rvm/hooks/
fi

if [ ! -d ~/.dotfiles/dependencied/fonts ]; then
  echo "Setting up patched Powerline fonts..."
  git clone git@github.com:powerline/fonts.git ~/.dotfiles/dependencies/fonts
  ~/.dotfiles/dependencies/fonts/install.sh
fi

nerd_fonts_dir=$HOME/.dotfiles/dependencies/patched-nerd-fonts

if [ ! -d $nerd_fonts_dir ]; then
  echo "Pulling in patched nerd-fonts..."

  mkdir -p $nerd_fonts_dir

  cd $nerd_fonts_dir && \
    git init && \
    mkdir .git/info && \
    git remote add origin https://github.com/ryanoasis/nerd-fonts.git && \
    git config core.sparsecheckout true && \
    echo "patched-fonts/*" >> .git/info/sparse-checkout && \
    git pull --depth=1 origin master

  cp $nerd_fonts_dir/**/*.ttf $HOME/Library/Fonts
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

if [ ! -d ~/.zshenv ]; then
  ln -s ~/.dotfiles/zsh/zshenv ~/.zshenv
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

echo "Setting up ctags"
if [ ! -f ~/.ctags ]; then
  ln -s ~/.dotfiles/ctags ~/.ctags
fi

echo "Setting up pry"
if [ ! -f ~/.pryrc ]; then
  ln -s ~/.dotfiles/irb/pryrc ~/.pryrc
fi

if [ ! -f ~/.unescaped_colors.rb ]; then
  ln -s ~/.dotfiles/irb/unescaped_colors.rb ~/.unescaped_colors.rb
fi

if [ ! -d ~/.tmuxinator ]; then
  echo "Setting up Tmuxinator"
  ln -s ~/.dotfiles/tmuxinator ~/.tmuxinator
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

if [ ! -d ~/.config ]; then
  mkdir -p ~/.config
fi

if [ ! -d ~/.config/nvim ]; then
  echo "Setting up Neovim config"
  ln -s ~/.dotfiles/nvim ~/.config/nvim
fi

echo "Installing nvim plugins"
nvim +PlugInstall
