#!/usr/bin/env bash

# dorothy configuration options:
# https://github.com/bevry/dorothy#configuration
# https://github.com/bevry/dorothy/blob/master/sources/defaults.sh

# inherit the cross-platform shell configuration
source "$DOROTHY/user/source.sh"

# prepare
hostname="$("$DOROTHY/commands/get-hostname")"

# act
if test -f "$DOROTHY/user/env/$hostname.bash"; then
	# hostname has private configuration
	source "$DOROTHY/user/env/$hostname.bash"
elif test -f "$DOROTHY/user/sources/$hostname.bash"; then
	# hostname has public configuration
	source "$DOROTHY/user/sources/$hostname.bash"
elif test -f "$DOROTHY/user/env/generic.bash"; then
	# use generic secret configuration if it is present
	source "$DOROTHY/user/env/generic.bash"
elif test -f "$DOROTHY/user/sources/generic.bash"; then
	# use generic public configuration if it is present
	source "$DOROTHY/user/sources/generic.bash"
fi


# TODO: source other stuff
# # source all files in confdir
# local files=("$confdir"/*.{sh,bash,zsh})
# local f; for f in ${(o)files}; do
#   # ignore files that begin with a tilde
#   case ${f:t} in '~'*) continue;; esac
#   source "$f"
# done

