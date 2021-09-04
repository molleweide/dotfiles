# GITSTATUS_LOG_LEVEL=DEBUG

# zprof if we ever need to profile
alias runzprof="ZPROF=true zsh"
[[ $ZPROF != true ]] || zmodload zsh/zprof
alias zbench='for i in $(seq 1 10); do; /usr/bin/time zsh -i -c exit; done'

##########################################################
# NOTE: CACHE DIRECTORY (FOR OH-MY-ZSH PLUGINS)
##########################################################

[ ! -d $XDG_CACHE_HOME/zsh/zcustom/cache ] && \
    mkdir -p $XDG_CACHE_HOME/zsh/zcustom/cache

export ZSH="${XDG_DATA_HOME:-$HOME/.local/share}/zsh/zcustom"
export ZSH_CACHE_DIR="$ZSH/cache"

#############################################################
# NOTE: RANDOM SETTINGS
#############################################################

# Disable auto title so tmux window titles don't get messed up.
export DISABLE_AUTO_TITLE="true"

# Maintain a stack of cd directory traversals for `popd`
setopt AUTO_PUSHD

# Allow extended matchers like ^file, etc
set -o EXTENDED_GLOB

#############################################################
# NOTE: HISTORY SETTINGS
#############################################################

export HISTFILE="$XDG_STATE_HOME"/zsh/history

HISTSIZE=100000
SAVEHIST=100000

setopt append_history
setopt extended_history
setopt hist_expire_dups_first
setopt hist_ignore_dups # ignore duplication command history list
setopt hist_ignore_space
setopt inc_append_history
setopt share_history # share command history data
setopt extended_glob

#############################################################
# NOTE: PLUGINS (ANTIGEN)
#############################################################

export ADOTDIR="${XDG_DATA_HOME:-$HOME/.local/share}/antigen"
export ANTIGEN_COMPDUMP="${ADOTDIR}/.zcompdump"
export ANTIGEN_LOG="${ADOTDIR}/antigen.log"
export ANTIGEN_DEBUG_LOG="${ADOTDIR}/antigen_debug.log"

source ${ZDOTDIR}/antigen.zsh

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

#############################################################
# NOTE: CUSTOM SETTINGS
#############################################################

for file in $HOME/.zsh/custom/**/*.zsh
do
  source $file
done

for file in $HOME/.zsh/secrets/**/*.zsh
do
  source $file
done

# add functions
autoload -Uz "$XDG_CONFIG_HOME/zsh/functions/autoload_funcd"
autoload_funcd "$XDG_CONFIG_HOME/zsh/functions" true

# source all files in confdir
autoload -Uz "$XDG_CONFIG_HOME/zsh/functions/source_confd"
source_confd "$XDG_CONFIG_HOME/zsh/zshrc.d"

#############################################################
## NOTE: VI SETTINGS
##############################################################

# Vim style ^W del word backwards
autoload -U select-word-style
select-word-style bash
export WORDCHARS='.-'

# custor
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

#############################################################
# NOTE: HASKELL
#############################################################

. ~/.ghcup/env

[ -f ~/.zshrc.local ] && source ~/.zshrc.local
[ -f "/Users/hjalmarjakobsson/.ghcup/env" ] && source "/Users/hjalmarjakobsson/.ghcup/env" # ghcup-env


#############################################################
# NOTE: RVM is a special snowflake and needs to be last, WHY?!
#############################################################

if [ ! -f ~/.config/dotfiles/rbenv ]; then
  export PATH="$HOME/.rvm/bin:$PATH"
  [ -f ~/.rvm/scripts/rvm ] && source ~/.rvm/scripts/rvm
fi

# if using nvm, this will generate error
# if not installed
# eval "$(nodenv init -)"

[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion

# # done profiling
# [[ $ZPROF != true ]] || { unset ZPROF && zprof }




# NOTE: others below !!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!







#######################################################
# NOTE: MATTRC - PLUGINS ##############################
#######################################################

# PZ_PLUGIN_HOME="${ZDOTDIR:-$HOME/.config/zsh}/plugins"
# [[ -d $PZ_PLUGIN_HOME/pz ]] ||
#   git clone --depth=1 --recursive https://github.com/mattmc3/pz.git $PZ_PLUGIN_HOME/pz
# source $PZ_PLUGIN_HOME/pz/pz.zsh

# # source prezto
# pz source sorin-ionescu/prezto



# local secrets and settings
[[ -f $DOTFILES.local/zsh/zshrc.local.zsh ]] && . $DOTFILES.local/zsh/zshrc.local.zsh

# # done profiling
# [[ $ZPROF != true ]] || { unset ZPROF && zprof }


#######################################################
# NOTE: luke ##########################################
#######################################################




# # Luke's config for the Zoomer Shell

# # Enable colors and change prompt:
# autoload -U colors && colors	# Load colors
# PS1="%B%{$fg[red]%}[%{$fg[yellow]%}%n%{$fg[green]%}@%{$fg[blue]%}%M %{$fg[magenta]%}%~%{$fg[red]%}]%{$reset_color%}$%b "
# setopt autocd		# Automatically cd into typed directory.
# stty stop undef		# Disable ctrl-s to freeze terminal.
# setopt interactive_comments


# # Load aliases and shortcuts if existent.
# [ -f "${XDG_CONFIG_HOME:-$HOME/.config}/shell/shortcutrc" ] && source "${XDG_CONFIG_HOME:-$HOME/.config}/shell/shortcutrc"
# [ -f "${XDG_CONFIG_HOME:-$HOME/.config}/shell/aliasrc" ] && source "${XDG_CONFIG_HOME:-$HOME/.config}/shell/aliasrc"
# [ -f "${XDG_CONFIG_HOME:-$HOME/.config}/shell/zshnameddirrc" ] && source "${XDG_CONFIG_HOME:-$HOME/.config}/shell/zshnameddirrc"

# # Basic auto/tab complete:
# autoload -U compinit
# zstyle ':completion:*' menu select
# zmodload zsh/complist
# compinit
# _comp_options+=(globdots)		# Include hidden files.

# # vi mode
# bindkey -v
# export KEYTIMEOUT=1

# # Use vim keys in tab complete menu:
# bindkey -M menuselect 'h' vi-backward-char
# bindkey -M menuselect 'k' vi-up-line-or-history
# bindkey -M menuselect 'l' vi-forward-char
# bindkey -M menuselect 'j' vi-down-line-or-history
# bindkey -v '^?' backward-delete-char

# # Change cursor shape for different vi modes.
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

# # Use lf to switch directories and bind it to ctrl-o
# lfcd () {
#     tmp="$(mktemp)"
#     lf -last-dir-path="$tmp" "$@"
#     if [ -f "$tmp" ]; then
#         dir="$(cat "$tmp")"
#         rm -f "$tmp" >/dev/null
#         [ -d "$dir" ] && [ "$dir" != "$(pwd)" ] && cd "$dir"
#     fi
# }
# bindkey -s '^o' 'lfcd\n'

# bindkey -s '^a' 'bc -lq\n'

# bindkey -s '^f' 'cd "$(dirname "$(fzf)")"\n'

# bindkey '^[[P' delete-char

# # Edit line in vim with ctrl-e:
# autoload edit-command-line; zle -N edit-command-line
# bindkey '^e' edit-command-line

# # Load syntax highlighting; should be last.
# source /usr/share/zsh/plugins/fast-syntax-highlighting/fast-syntax-highlighting.plugin.zsh 2>/dev/null
