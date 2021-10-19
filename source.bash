#!/usr/bin/env bash

# inherit the cross-platform shell configuration
source "$DOROTHY/user/source.sh"

# user_sources=("$DOROTHY/user/sources"/*.{sh,bash})
# for f in $DOROTHY/user/sources/*; do
for f in "$DOROTHY/user/sources/"*.bash; do
  # ignore files that begin with a tilde
  # echo $f
  if test $f = $DOROTHY/user/sources/paths.bash; then continue; fi
  source "$f"
done
