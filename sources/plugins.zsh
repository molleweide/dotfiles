# # plugin variables
# PURE_PROMPT_SYMBOL="%%"

# [[ -d $PZ_PLUGIN_HOME/shell-safe-rm ]] || pz clone kaelzhang/shell-safe-rm
# #pz source zsh-users/zsh-autosuggestions
# #pz source zsh-users/zsh-completions
# #pz source zsh-users/zsh-history-substring-search
# #pz source mattmc3/zsh-cd-ls
# pz source rupa/z
# pz source zdharma/fast-syntax-highlighting

if test -f "$ADOTDIR/antigen.zsh"; then

    source "$ADOTDIR/antigen.zsh"

    # remove bundle with: antigen purge <bundle>

    antigen bundle robbyrussell/oh-my-zsh plugins/git

    antigen bundle robbyrussell/oh-my-zsh plugins/nvm
    antigen bundle robbyrussell/oh-my-zsh plugins/pyenv
    antigen bundle robbyrussell/oh-my-zsh plugins/rvm

    antigen bundle robbyrussell/oh-my-zsh plugins/vi-mode
    antigen bundle robbyrussell/oh-my-zsh plugins/zsh_reload

    antigen bundle dbalatero/fzf-git
    antigen bundle DarrinTisdale/zsh-aliases-exa
    antigen bundle chriskempson/base16-shell
    # antigen bundle wookayin/fzf-fasd
    antigen bundle rupa/z z.sh
    antigen bundle twang817/zsh-ssh-agent
    antigen bundle zsh-users/zsh-completions
    antigen bundle zdharma/fast-syntax-highlighting
    antigen bundle hlissner/zsh-autopair

    antigen theme romkatv/powerlevel10k

    antigen apply

    [ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

    eval "$(direnv hook zsh)"
    # eval "$(fasd --init auto)"
fi
