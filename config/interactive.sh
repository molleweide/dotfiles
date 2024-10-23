#!/usr/bin/env bash
# shellcheck disable=SC2034
# use inline `export VAR=...` statements, for fish compatibility`

# echo "user -> config/interactive.sh"

# load defaults
source "$DOROTHY/config/interactive.sh"

# echo "(interactive.sh) -> $1; $2"

# load my fancy stuff
for f in "$DOROTHY/user/sources/"*.sh; do
  source "$f"
done

nman() {
  nvim "+hide Man $1"
}
