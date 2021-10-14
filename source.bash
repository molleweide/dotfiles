#!/usr/bin/env bash

# inherit the cross-platform shell configuration
source "$DOROTHY/user/source.sh"

local user_sources=("$DOROTHY/user/sources"/*.{sh,bash,zsh})
local f; for f in ${(o)user_sources}; do
  # ignore files that begin with a tilde
  case ${f:t} in '~'*) continue;; esac
  source "$f"
done
