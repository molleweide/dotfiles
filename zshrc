export DISABLE_AUTO_TITLE="true"
setopt AUTO_PUSHD
setopt PROMPT_SUBST

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

# zmodload zsh/zprof

export ZPLUG_HOME=/usr/local/opt/zplug
source $ZPLUG_HOME/init.zsh

# zplug "caiogondim/bullet-train.zsh", as:theme
zplug "dijitalmunky/nvm-auto", defer:3
zplug "plugins/autojump", from:oh-my-zsh
# zplug "plugins/elixir", from:oh-my-zsh
zplug "plugins/git", from:oh-my-zsh
zplug "plugins/ssh-agent", from:oh-my-zsh
zplug "plugins/vi-mode", from:oh-my-zsh
zplug "plugins/zsh_reload", from:oh-my-zsh
zplug "zsh-users/zsh-history-substring-search"
zplug "zsh-users/zsh-syntax-highlighting", defer:2

if ! zplug check --verbose; then
  printf "Install? [y/N]: "
  if read -q; then
    echo; zplug install
  fi
fi

export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && . "$NVM_DIR/nvm.sh"  # This loads nvm

zplug load

# BULLETTRAIN_PROMPT_ORDER=(
#   status
#   custom
#   context
#   dir
#   ruby
#   nvm
#   git
#   cmd_exec_time
# )
#
# zsh export NVM_DIR="$HOME/.nvm"
# zsh [ -s "$NVM_DIR/nvm.sh" ] && . "$NVM_DIR/nvm.sh"  # This loads nvm

# function zsh_plugin() {
#   source $HOME/.zsh/plugins/$1.zsh
# }
#
# zsh_plugin autojump
# zsh_plugin git
# zsh_plugin reload
# zsh_plugin ssh-agent
# zsh_plugin vi-mode

for file in $HOME/.zsh/custom/**/*.zsh
do
  source $file
done

source $HOME/.zsh/after.zsh

[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh
