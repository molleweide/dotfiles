#!/usr/bin/env bash

function apt_update() {
  sudo apt-get update
}

function apt_install() {
  local package=$1

  if dpkg -l "$package" >/dev/null 2>&1; then
    dotsay "+ $package already installed... skipping."
  else
    sudo apt-get install "$package"
  fi
}
