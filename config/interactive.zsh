#!/usr/bin/env bash
# shellcheck disable=SC2034
# use inline `export VAR=...` statements, for fish compatibility`

# echo "user -> config/interactive.zsh"

export DOROTHY_THEME="oz"

# load defaults
source "$DOROTHY/config/interactive.zsh"

# load cross shell `sh` files
source "$DOROTHY/user/config/interactive.sh"

# cross shell scripts should b written in `sh`
# `sh`is the only script that is allowed to be sourced in other shells.
# source "$DOROTHY/user/config/interactive.bash" #??

for f in "$DOROTHY/user/sources/"*.zsh; do
    source "$f"
done


# # fzf support
# github_fzf_helper="$GHQ_GITHUB/junegunn/fzf-git.sh/fzf-git.sh"
# set -x
# if [[ -f "$github_fzf_helper" ]]; then
# source "$GHQ_GITHUB/junegunn/fzf-git.sh/fzf-git.sh"
# fi
# set +x

