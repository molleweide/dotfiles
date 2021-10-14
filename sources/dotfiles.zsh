export DOTFILES=~/.dorothy/user
alias dt='cd "$DOTFILES"'
alias dr='cd "$DOROTHY"'
alias dte='cd "$DOTFILES" && ${VISUAL:-${EDITOR:-vim}} .'
alias dtr='cd "$DOROTHY" && ${VISUAL:-${EDITOR:-vim}} .'
