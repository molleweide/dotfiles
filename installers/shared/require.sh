#!/usr/bin/env bash

declare -a _required_installers=()

function array_contains() {
    local n=$#
    local value=${!n}
    for ((i=1;i < $#;i++)) {
        if [ "${!i}" == "${value}" ]; then
            echo "y"
            return 0
        fi
    }
    echo "n"
    return 1
}

function require_installer() {
  local name=$1
  local installer_path="$(dotfiles_location)/installers/$name"

  # Don't include installers twice
  if [ ! $(array_contains "${_required_installers[@]}" "$name") == "y" ]; then
    source $installer_path

    dotsay "@b@blue[[+ Done!]]"
    echo
  fi

  _required_installers+=("$name")

  return 0
}
