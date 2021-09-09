# Use jk to exit insert mode on the command line
bindkey -M viins 'zm' vi-cmd-mode

# Vim style ^W del word backwards
autoload -U select-word-style
select-word-style bash
export WORDCHARS='.-'

WORDCHARS='*?_-.[]~=&;!#$%^(){}<>'
