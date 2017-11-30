#!/usr/bin/env bash

function install_package() {
  local brew_name=$1
  local apt_name=$2

  if is_macos; then
    [[ "$brew_name" != "" ]] && brew_install "$brew_name"
  elif is_linux; then
    [[ "$apt_name" != "" ]] && apt_install "$apt_name"
  fi
}
