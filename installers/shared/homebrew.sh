#!/usr/bin/env bash

function brew_install() {
  local package=$1

  ! is_macos && return 1

  if brew list "$package" > /dev/null 2>&1; then
    dotsay "+ $package already installed... skipping."
  else
    brew install $@
  fi
}

function brew_install_all() {
  local packages=("$@")

  ! is_macos && return 1

  for package in "${packages[@]}"; do
    brew_install $package
  done
}
