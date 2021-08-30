# ======== Debug ===========

# GITSTATUS_LOG_LEVEL=DEBUG

# ======== Cache directory (for oh-my-zsh plugins) =========
[ ! -d $HOME/.zcustom/cache ] && mkdir -p $HOME/.zcustom/cache

export ZSH="$HOME/.zcustom"
export ZSH_CACHE_DIR="$ZSH/cache"
export GEM_HOME="$HOME/.gem" # prevent permission err on main laptop


# ======== Random settings ===========

# Disable auto title so tmux window titles don't get messed up.
export DISABLE_AUTO_TITLE="true"

# Maintain a stack of cd directory traversals for `popd`
setopt AUTO_PUSHD

# Allow extended matchers like ^file, etc
set -o EXTENDED_GLOB

# ========= History settings =========
if [ -z "$HISTFILE" ]; then
  HISTFILE=$HOME/.zsh_history
fi

HISTSIZE=10000
SAVEHIST=10000

setopt append_history
setopt extended_history
setopt hist_expire_dups_first
setopt hist_ignore_dups # ignore duplication command history list
setopt hist_ignore_space
setopt inc_append_history
setopt share_history # share command history data
setopt extended_glob

# =========== Plugins ============
source $HOME/.zsh/vendor/antigen.zsh

antigen bundle robbyrussell/oh-my-zsh plugins/git

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
# antigen bundle wookayin/fzf-fasd
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

# =========== Custom settings ================

for file in $HOME/.zsh/custom/**/*.zsh
do
  source $file
done

for file in $HOME/.zsh/secrets/**/*.zsh
do
  source $file
done

# Vim style ^W del word backwards
autoload -U select-word-style
select-word-style bash
export WORDCHARS='.-'

# =========== haskell ghci ===============
. ~/.ghcup/env

# =========== Vi cursor shapes ===============
# function zle-keymap-select () {
#     case $KEYMAP in
#         vicmd) echo -ne '\e[1 q';;      # block
#         viins|main) echo -ne '\e[5 q';; # beam
#     esac
# }
# zle -N zle-keymap-select
# zle-line-init() {
#     zle -K viins # initiate `vi insert` as keymap (can be removed if `bindkey -V` has been set elsewhere)
#     echo -ne "\e[5 q"
# }
# zle -N zle-line-init
# echo -ne '\e[5 q' # Use beam shape cursor on startup.
# preexec() { echo -ne '\e[5 q' ;} # Use beam shape cursor for each new prompt.

# ======= RVM is a special snowflake and needs to be last ========
if [ ! -f ~/.config/dotfiles/rbenv ]; then
  export PATH="$HOME/.rvm/bin:$PATH"
  [ -f ~/.rvm/scripts/rvm ] && source ~/.rvm/scripts/rvm
fi

# if using nvm, this will generate error
# if not installed
# eval "$(nodenv init -)"

[ -f ~/.zshrc.local ] && source ~/.zshrc.local
[ -f "/Users/hjalmarjakobsson/.ghcup/env" ] && source "/Users/hjalmarjakobsson/.ghcup/env" # ghcup-env

export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion
