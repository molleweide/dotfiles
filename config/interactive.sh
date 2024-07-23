#!/usr/bin/env bash
# shellcheck disable=SC2034
# use inline `export VAR=...` statements, for fish compatibility`

echo "??????"

# load defaults
source "$DOROTHY/config/interactive.sh"

export DOROTHY_THEME='oz'

# load my fancy stuff
for f in "$DOROTHY/user/sources/"*.sh; do
  source "$f"
done

echo "from interactive.sh"
