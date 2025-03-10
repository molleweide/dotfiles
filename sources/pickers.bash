#!/usr/bin/env bash

function pickers_options_help {
  cat <<-EOF
		  USAGE:
		  $(basename "${BASH_SOURCE[1]}") [...<options>] <action>

			PICKERS:
			$(declare -F | awk '{print "    " $3}' | grep 'picker__' | sed 's/picker__//')

			OPTIONS:
			    Options are forwarded to [fzf-helper]
	EOF
}

# ---------------------------------

function pickers_args {

  function help {
    cat <<-EOF >/dev/stderr
			    ABOUT

			    File hosting picker definitions.

			    USAGE:
			    $(basename "${BASH_SOURCE[2]}") [...<options>] <action>

			    PICKERS:
			    $(declare -F | awk '{print "    " $3}' | grep 'picker__' | sed 's/picker__//')

			    OPTIONS:
			        Options are forwarded to [fzf-helper]
		EOF
    if [[ $# -ne 0 ]]; then
      echo-error "$@"
    fi
    return 22 # EINVAL 22 Invalid argument
  }

  local item action='' options_flags=()
  while test "$#" -ne 0; do
    item="$1"
    shift
    case "$item" in
    '--help' | '-h') help ;;
    '--'*) options_flags+=("${item#*=}") ;;
    *)
      action="$item"
      ;;
    esac
  done

  if [[ -z "$action" ]]; then
    help "No action was provided."
  fi

  if test "$(type -t "picker__$action")" = 'function'; then
    "picker__$action" "${options_flags[@]}"
  else
    echo-style --error="Action [$action] does not exist." >/dev/stderr
    return 78 # ENOSYS 78 Function not implemented
  fi
}
