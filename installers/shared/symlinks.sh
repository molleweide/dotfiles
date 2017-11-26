#!/usr/bin/env bash

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
