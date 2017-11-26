#!/usr/bin/env bash

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
