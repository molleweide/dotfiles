#!/usr/bin/env bash

# Use this when the names are the same
function install_package() {
  local name=$1

  if is_macos; then
    brew_install "$name"
  elif is_linux; then
    apt_install "$name"
  fi
}

function command_exists() {
  local name=$1

  command -v "$name" >/dev/null 2>&1
}
