[ -f ~/.zshrc.local ] && source ~/.zshrc.local

# ======== Cache directory (for oh-my-zsh plugins) =========
[ ! -d $HOME/.zcustom/cache ] && mkdir -p $HOME/.zcustom/cache

export ZSH="$HOME/.zcustom"
export ZSH_CACHE_DIR="$ZSH/cache"

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

antigen bundle robbyrussell/oh-my-zsh plugins/fasd
antigen bundle robbyrussell/oh-my-zsh plugins/git
antigen bundle robbyrussell/oh-my-zsh plugins/nvm
antigen bundle robbyrussell/oh-my-zsh plugins/pyenv
antigen bundle robbyrussell/oh-my-zsh plugins/rvm
antigen bundle robbyrussell/oh-my-zsh plugins/vi-mode
antigen bundle robbyrussell/oh-my-zsh plugins/zsh_reload

antigen bundle dbalatero/fzf-git
antigen bundle DarrinTisdale/zsh-aliases-exa
antigen bundle chriskempson/base16-shell
antigen bundle wookayin/fzf-fasd
antigen bundle twang817/zsh-ssh-agent
antigen bundle zsh-users/zsh-completions
antigen bundle zdharma/fast-syntax-highlighting

antigen theme romkatv/powerlevel10k

antigen apply

[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

eval "$(direnv hook zsh)"

# =========== Custom settings ================

for file in $HOME/.zsh/custom/**/*.zsh
do
  source $file
done

for file in $HOME/.zsh/secrets/**/*.zsh
do
  source $file
done

# ======= RVM is a special snowflake and needs to be last ========
export PATH="$HOME/.rvm/bin:$PATH"
[ -f ~/.rvm/scripts/rvm ] && source ~/.rvm/scripts/rvm
