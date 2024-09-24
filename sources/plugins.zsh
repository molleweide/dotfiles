# PURE_PROMPT_SYMBOL="%%"

# NOTE: rename this file to zsh-plugins, because it deals with adding
# plugins to the zsh.

# https://github.com/ohmyzsh/ohmyzsh/tree/master/plugins
# https://travis.media/top-10-oh-my-zsh-plugins-for-productive-developers/

# if test -f "$ADOTDIR/antigen.zsh"; then


# echo "user -> sources/ >> load antigen"


source "$ADOTDIR/antigen.zsh"

# # remove bundle with: antigen purge <bundle>
# ANTIGEN_PLUGINS=(
# git
# nvm
# pyenv
# rvm
# vi-mode
# dbalatero/fzf-git
# DarrinTisdale/zsh-aliases-exa
# chriskempson/base16-shell
# wookayin/fzf-fasd
# # rupa/z z.sh
# twang817/zsh-ssh-agent
# zsh-users/zsh-completions
# zdharma/fast-syntax-highlighting
# hlissner/zsh-autopair
# )
#
# function antigen_install() {
#   for f in "${ANTIGEN_PLUGINS[@]}"; do
#     antigen bundle "$f"
#   done
#   antigen apply
# }

antigen bundle git
antigen bundle nvm
antigen bundle pyenv
antigen bundle rvm
antigen bundle vi-mode

# NOTE: replace with https://github.com/Aloxaf/fzf-tab
# antigen bundle dbalatero/fzf-git
antigen bundle Aloxaf/fzf-tab

# THIS IS SPECIFICALLY A ZSH PLUGIN
# https://github.com/DarrinTisdale/zsh-aliases-exa
antigen bundle DarrinTisdale/zsh-aliases-exa

# I HAVE NO IDEA WHAT THIS DOES..
# antigen bundle chriskempson/base16-shell

antigen bundle wookayin/fzf-fasd

# antigen bundle rupa/z z.sh

antigen bundle twang817/zsh-ssh-agent

antigen bundle zsh-users/zsh-completions

# antigen bundle zdharma/fast-syntax-highlighting

antigen bundle hlissner/zsh-autopair

antigen apply

[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

eval "$(direnv hook zsh)"
eval "$(fasd --init auto)"

# fi
