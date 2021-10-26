#!/usr/bin/env bash

# use my own theme
export DOROTHY_THEME='system'

# make sure when we use bash, we use globstar if it is supported
if [[ "$BASH_VERSION" = "4."* || "$BASH_VERSION" = "5."* ]]; then
	source "$DOROTHY/sources/globstar.bash"
fi

# load my fancy stuff
for f in "$DOROTHY/user/sources/"*.sh; do
  source "$f"
done
