#!/usr/bin/env bash

for f in "$DOROTHY/user/sources/"*.zsh; do
    source "$f"
done

# # load my fancy stuff
# for filepath in "$DOROTHY/user/sources/"*.sh; do
#     local filename="$(basename "$filepath")"
#     if test "${filename:0:2}"  != '~.' ]]; then
#         source "$filepath"
#     fi
# done

# if [[ ! $filename =~ "~.kbd" ]]; then
#     cat "$f"
# fi

# # load my .sh sources that don't start with ~.
# for filepath in "$DOROTHY/user/sources/"!(~.*).sh; do
#     source "$filepath"
# done

