#!/usr/bin/env bash

# FUNCNAME | https://stackoverflow.com/questions/1835943/how-to-determine-function-name-from-inside-a-function
#   An array variable containing the names of all shell functions currently in
#   the execution call stack.   The  element  with index  0 is the name of any
#   currently-executing shell function.  The bottom-most element is "main".
#   This variable exists only when a shell function is executing.  Assignments
#   to FUNCNAME have no effect and return an error status.  If FUNCNAME is
#   unset, it loses its special properties, even if it is subsequently reset.


# BASH_SOURCE | https://stackoverflow.com/questions/35006457/choosing-between-0-and-bash-source
#   An array variable whose members are the source filenames corresponding
#   to the elements in the FUNCNAME array variable.
#   ```source "${BASH_SOURCE%/*}/shared.sh"```

shared_dir="${BASH_SOURCE%/*}/shared"

# # testing/learning
# echo "${BASH_SOURCE}"
# echo "${BASH_SOURCE%}"
# echo "${BASH_SOURCE%/*}"
# echo "${BASH_SOURCE%/*}/shared"

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
