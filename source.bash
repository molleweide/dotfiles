#!/usr/bin/env bash

# inherit the cross-platform shell configuration
source "$DOROTHY/user/source.sh"

for f in "$DOROTHY/user/sources/"*.bash; do
  if test $f = $DOROTHY/user/sources/paths.bash; then continue; fi
  source "$f"
done
