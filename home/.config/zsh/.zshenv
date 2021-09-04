#!/bin/zsh

# ~/.zshenv should only be a one-liner that sources this file
# echo "export ZDOTDIR=~/.config/zsh; . \$ZDOTDIR/.zshenv" >| ~/.zshenv

export ZDOTDIR=${ZDOTDIR:-$HOME/.config/zsh}

# Ensure that a non-login, non-interactive shell has a defined environment
if [[ ( "$SHLVL" -eq 1 && ! -o LOGIN ) && -s "${ZDOTDIR:-$HOME}/.zprofile" ]]; then
  source "${ZDOTDIR:-$HOME}/.zprofile"
fi

#### old below #####

# source ~/.zsh/custom/exports.zsh

# if [[ -n $VIRTUAL_ENV && -e "${VIRTUAL_ENV}/bin/activate" ]]; then
#   source "${VIRTUAL_ENV}/bin/activate"
# fi

# # TODO: mv this
source "$HOME/.cargo/env"

# # export TERMINFO=/usr/lib/terminfo
