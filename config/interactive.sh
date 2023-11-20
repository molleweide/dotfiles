#!/usr/bin/env bash
# shellcheck disable=SC2034
# use inline `export VAR=...` statements, for fish compatibility`

# load defaults
source "$DOROTHY/config/interactive.sh"

export DOROTHY_THEME='starship'

# load my fancy stuff
for f in "$DOROTHY/user/sources/"*.sh; do
  source "$f"
done
