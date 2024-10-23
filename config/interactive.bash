#!/usr/bin/env bash
# shellcheck disable=2034,1091
# use inline `export VAR=...` statements, for fish compatibility`

# load defaults
source "$DOROTHY/config/interactive.bash"

# load cross shell `sh` files
source "$DOROTHY/user/config/interactive.sh"

for f in "$DOROTHY/user/sources/"*.bash; do
  source "$f"
done
