# zprof if we ever need to profile
alias runzprof="ZPROF=true zsh"
[[ $ZPROF != true ]] || zmodload zsh/zprof
alias zbench='for i in $(seq 1 10); do; /usr/bin/time zsh -i -c exit; done'

# setup pz as our plugin manager
PZ_PLUGIN_HOME="${ZDOTDIR:-$HOME/.config/zsh}/plugins"
[[ -d $PZ_PLUGIN_HOME/pz ]] ||
  git clone --depth=1 --recursive https://github.com/mattmc3/pz.git $PZ_PLUGIN_HOME/pz
source $PZ_PLUGIN_HOME/pz/pz.zsh

# source prezto
pz source sorin-ionescu/prezto

# add functions
autoload -Uz "$XDG_CONFIG_HOME/zsh/functions/autoload_funcd"
autoload_funcd "$XDG_CONFIG_HOME/zsh/functions" true

# source all files in confdir
autoload -Uz "$XDG_CONFIG_HOME/zsh/functions/source_confd"
source_confd "$XDG_CONFIG_HOME/zsh/zshrc.d"

# local secrets and settings
[[ -f $DOTFILES.local/zsh/zshrc.local.zsh ]] && . $DOTFILES.local/zsh/zshrc.local.zsh

# done profiling
[[ $ZPROF != true ]] || { unset ZPROF && zprof }
