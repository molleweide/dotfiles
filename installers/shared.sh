#!/usr/bin/env bash

shared_dir="${BASH_SOURCE%/*}/shared"

if [[ "$SOURCED_SHARED_DOTFILES" != "yes" ]]; then
  source "$shared_dir/functions.sh"

  SOURCED_SHARED_DOTFILES="yes"
fi
