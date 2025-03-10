#!/usr/bin/env bash

function pickers_options_help {
	cat <<-EOF
  USAGE:
  $(basename ${BASH_SOURCE[1]}) [...<options>] <action>

	PICKERS:
	$(declare -F | awk '{print "    " $3}' | grep 'picker__' | sed 's/picker__//')

	OPTIONS:
	    Options are forwarded to [fzf-helper]


	EOF
}
