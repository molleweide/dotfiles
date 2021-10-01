# # plugin variables
# PURE_PROMPT_SYMBOL="%%"

# [[ -d $PZ_PLUGIN_HOME/shell-safe-rm ]] || pz clone kaelzhang/shell-safe-rm
# #pz source zsh-users/zsh-autosuggestions
# #pz source zsh-users/zsh-completions
# #pz source zsh-users/zsh-history-substring-search
# #pz source mattmc3/zsh-cd-ls
# pz source rupa/z
# pz source zdharma/fast-syntax-highlighting

#############################################################
# NOTE: PLUGINS (ANTIGEN)
#############################################################

export ADOTDIR="${XDG_DATA_HOME:-$HOME/.local/share}/antigen"
export ANTIGEN_COMPDUMP="${ADOTDIR}/.zcompdump"
export ANTIGEN_LOG="${ADOTDIR}/antigen.log"
export ANTIGEN_DEBUG_LOG="${ADOTDIR}/antigen_debug.log"

source ${ZDOTDIR}/vendor/antigen.zsh

antigen bundle robbyrussell/oh-my-zsh plugins/git

# what is this????
if [ ! -f ~/.config/dotfiles/no-nvm ]; then
  antigen bundle robbyrussell/oh-my-zsh plugins/nvm
fi

antigen bundle robbyrussell/oh-my-zsh plugins/pyenv

if [ ! -f ~/.config/dotfiles/rbenv ]; then
  antigen bundle robbyrussell/oh-my-zsh plugins/rvm
else
  antigen bundle robbyrussell/oh-my-zsh plugins/rbenv
fi

antigen bundle robbyrussell/oh-my-zsh plugins/vi-mode
antigen bundle robbyrussell/oh-my-zsh plugins/zsh_reload

antigen bundle dbalatero/fzf-git
antigen bundle DarrinTisdale/zsh-aliases-exa
antigen bundle chriskempson/base16-shell
antigen bundle wookayin/fzf-fasd
antigen bundle twang817/zsh-ssh-agent
antigen bundle zsh-users/zsh-completions
antigen bundle zdharma/fast-syntax-highlighting
antigen bundle hlissner/zsh-autopair

antigen theme romkatv/powerlevel10k

antigen apply

[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

eval "$(direnv hook zsh)"
eval "$(fasd --init auto)"

# export PATH=/usr/local/Cellar/z/1.9/etc/profile.d/z.sh:$PATH
