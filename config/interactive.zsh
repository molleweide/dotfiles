#!/usr/bin/env bash
# shellcheck disable=SC2034
# use inline `export VAR=...` statements, for fish compatibility`

# echo "user -> config/interactive.zsh"

export DOROTHY_THEME="oz"

# load defaults
source "$DOROTHY/config/interactive.zsh"

# load my bash and sh configs
source "$DOROTHY/user/config/interactive.sh"
source "$DOROTHY/user/config/interactive.bash" #??

for f in "$DOROTHY/user/sources/"*.zsh; do
    source "$f"
done
