#!/usr/bin/env bash

# NOTE: BASH_SOURCE | https://stackoverflow.com/questions/35006457/choosing-between-0-and-bash-source
# NOTE: An array variable whose members are the source filenames corresponding to the elements in the FUNCNAME array variable.
# NOTE: this is how it is used currently in installer scripts
# NOTE: ```source "${BASH_SOURCE%/*}/shared.sh"```

shared_dir="${BASH_SOURCE%/*}/shared"

if [[ "$SOURCED_SHARED_DOTFILES" != "yes" ]]; then
  source "$shared_dir/aptitude.sh"
  source "$shared_dir/config.sh"
  source "$shared_dir/custom-installers.sh"
  source "$shared_dir/git.sh"
  source "$shared_dir/homebrew.sh"
  source "$shared_dir/mac-app-store.sh"
  source "$shared_dir/os-detection.sh"
  source "$shared_dir/packages.sh"
  source "$shared_dir/require.sh"
  source "$shared_dir/stdout.sh"
  source "$shared_dir/symlinks.sh"

  SOURCED_SHARED_DOTFILES="yes"
fi
