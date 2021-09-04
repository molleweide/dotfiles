# ~/.zshenv should only be a one-liner that sources this file
# echo "export ZDOTDIR=~/.config/zsh; . \$ZDOTDIR/.zshenv" >| ~/.zshenv

export ZDOTDIR=${ZDOTDIR:-$HOME/.config/zsh}

# Ensure that a non-login, non-interactive shell has a defined environment
if [[ ( "$SHLVL" -eq 1 && ! -o LOGIN ) && -s "${ZDOTDIR:-$HOME}/.zprofile" ]]; then
  source "${ZDOTDIR:-$HOME}/.zprofile"
fi
