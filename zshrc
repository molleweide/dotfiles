export DISABLE_AUTO_TITLE="true"
setopt AUTO_PUSHD

export ZPLUG_HOME=/usr/local/opt/zplug
source $ZPLUG_HOME/init.zsh

zplug "caiogondim/bullet-train.zsh", as:theme
zplug "dijitalmunky/nvm-auto", defer:3
zplug "plugins/autojump", from:oh-my-zsh
zplug "plugins/elixir", from:oh-my-zsh
zplug "plugins/git", from:oh-my-zsh
zplug "plugins/jsontools", from:oh-my-zsh
zplug "plugins/ssh-agent", from:oh-my-zsh
zplug "plugins/vi-mode", from:oh-my-zsh
zplug "plugins/zsh_reload", from:oh-my-zsh
zplug "zsh-users/zsh-history-substring-search"
zplug "zsh-users/zsh-syntax-highlighting", defer:2

BULLETTRAIN_PROMPT_ORDER=(
  status
  custom
  context
  dir
  ruby
  nvm
  git
  cmd_exec_time
)

if ! zplug check --verbose; then
  printf "Install? [y/N]: "
  if read -q; then
    echo; zplug install
  fi
fi

export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && . "$NVM_DIR/nvm.sh"  # This loads nvm

zplug load

for file in $HOME/.zsh/custom/**/*.zsh
do
  source $file
done

source $HOME/.zsh/after.zsh
