#!/usr/bin/env bash
# shellcheck disable=SC2034
# use inline `export VAR=...` statements, for fish compatibility`

echo "user -> config/interactive.zsh"

# prompt off

export DOROTHY_THEME="oz"
export DOROTHY_THEME_LINE_VERBOSE="yes"
export DOROTHY_THEME_LINE_SEPARATOR="yes"
export DOROTHY_THEME_LINE_MEASURE="yes"
# export DOROTHY_THEME="starship"

export DOROTHY_KEYBINDS_DISABLE=yes

# load defaults
# source "$DOROTHY/config/interactive.zsh"

# load cross shell `sh` files, eg aliases
source "$DOROTHY/user/config/interactive.sh"

# cross shell scripts should b written in `sh`
# `sh`is the only script that is allowed to be sourced in other shells.
# source "$DOROTHY/user/config/interactive.bash" #??

# ignore_zsh_sources=(plugins )

# echo "zsh cache before loading plugins: $ZSH_CACHE_DIR"

echo "user -> config/interactive.zsh before loading sources"

for f in "$DOROTHY/user/sources/"*.zsh; do
  # if [[ "$f" == *"plugins.zsh" ]]; then
  #   :
  # else
  #     source "$f"
  # fi
  if [[ "$f" == *"_.zsh" ]]; then
    #   :
    # else
    #     source "$f"
    continue
  fi
  source "$f"
done

echo "user -> config/interactive.zsh after loading sources."

# echo "zsh cache after loading plugins: $ZSH_CACHE_DIR"

# # fzf support
# github_fzf_helper="$GHQ_GITHUB/junegunn/fzf-git.sh/fzf-git.sh"
# set -x
# if [[ -f "$github_fzf_helper" ]]; then
# source "$GHQ_GITHUB/junegunn/fzf-git.sh/fzf-git.sh"
# fi
# set +x

