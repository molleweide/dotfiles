#!/usr/bin/env bash
# shellcheck disable=2034,1091
# use inline `export VAR=...` statements, for fish compatibility`

source "$DOROTHY/config/shell.bash"

for f in "$DOROTHY/user/sources/"*.bash; do
  source "$f"
done
