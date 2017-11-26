#!/usr/bin/env bash

dotheader() {
  dotsay "@b@green[[$1]]"
}

dotsay() {
  local result=$(_colorized $@)
  echo "$result"
}

_colorized() {
   echo "$@" | sed -E \
     -e 's/((@(red|green|yellow|blue|magenta|cyan|white|reset|b|u))+)[[]{2}(.*)[]]{2}/\1\4@reset/g' \
     -e "s/@red/$(tput setaf 1)/g" \
     -e "s/@green/$(tput setaf 2)/g" \
     -e "s/@yellow/$(tput setaf 3)/g" \
     -e "s/@blue/$(tput setaf 4)/g" \
     -e "s/@magenta/$(tput setaf 5)/g" \
     -e "s/@cyan/$(tput setaf 6)/g" \
     -e "s/@white/$(tput setaf 7)/g" \
     -e "s/@reset/$(tput sgr0)/g" \
     -e "s/@b/$(tput bold)/g" \
     -e "s/@u/$(tput sgr 0 1)/g"
}

function brew_install() {
  local package=$1

  if brew list "$package" > /dev/null 2>&1; then
    dotsay "+ $package already installed... skipping."
  else
    brew install $@
  fi
}

function brew_install_all() {
  local packages=("$@")

  for package in "${packages[@]}"; do
    brew_install $package
  done
}

function dotfiles_location() {
  local current_dir="${BASH_SOURCE%/*}"
  echo $(cd $current_dir/../.. && pwd)
}

function symlink_dotfile() {
  local file=$1
  local destination=$2
  local full_file_path="$(dotfiles_location)/$file"

  if [ ! -e $destination ]; then
    echo "Symlinking $full_file_path -> $destination"
    ln -s $full_file_path $destination
  fi
}

function require_installer() {
  local name=$1
  local installer_path="$(dotfiles_location)/installers/$name"

  $installer_path

  dotsay "@b@blue[[+ Done!]]"
  echo
}
