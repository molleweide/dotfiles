#!/usr/bin/env bash
# shellcheck disable=SC2034
# use inline `export VAR=...` statements, for fish compatibility`

for f in "$DOROTHY/user/sources/"*.bash; do
  source "$f"
done
