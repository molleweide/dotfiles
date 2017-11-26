#!/usr/bin/env bash

shared_dir="${BASH_SOURCE%/*}/shared"

if [[ "$SOURCED_SHARED_DOTFILES" != "yes" ]]; then
  source "$shared_dir/homebrew.sh"
  source "$shared_dir/symlinks.sh"
  source "$shared_dir/stdout.sh"
  source "$shared_dir/require.sh"

  SOURCED_SHARED_DOTFILES="yes"
fi
