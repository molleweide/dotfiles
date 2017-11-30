#!/usr/bin/env bash

function apt_update() {
  sudo apt-get update
}

function apt_install() {
  local package=$1

  ! is_linux && return 1

  if dpkg -s "$package" >/dev/null 2>&1; then
    dotsay "+ $package already installed... skipping."
  else
    sudo apt-get install -y "$package"
  fi
}
