#!/usr/bin/env bash

shared_dir="${BASH_SOURCE%/*}/shared"

if [[ "$SOURCED_SHARED_DOTFILES" != "yes" ]]; then
  source "$shared_dir/config.sh"
  source "$shared_dir/custom-installers.sh"
  source "$shared_dir/os-detection.sh"
  source "$shared_dir/aptitude.sh"
  source "$shared_dir/homebrew.sh"
  source "$shared_dir/mac-app-store.sh"
  source "$shared_dir/packages.sh"
  source "$shared_dir/symlinks.sh"
  source "$shared_dir/stdout.sh"
  source "$shared_dir/require.sh"

  SOURCED_SHARED_DOTFILES="yes"
fi
