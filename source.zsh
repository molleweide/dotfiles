#!/usr/bin/env zsh

source "$DOROTHY/user/source.sh"

# user_sources=("$DOROTHY/user/sources"/*.zsh)
for f in "$DOROTHY/user/sources/"*.zsh; do
  source "$f"
done
