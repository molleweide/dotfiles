# OLD BASH PROFILE STARTS

# export PS1="h$ "
export PS1='\W$(__git_ps1 "(%s)") > '

# GIT_PS1_SHOWDIRTYSTATE=true
# export PS1='[\u@mbp \w$(__git_ps1)]\$ '

source ~/.profile

export PATH=/usr/local/bin:/usr/local/sbin:~/bin:$PATH
# # Homebrew python path
# export PATH=/usr/local/bin:/usr/local/sbin:~/bin:$PATH

# Setting PATH for Python 2.7
# The orginal version is saved in .bash_profile.pysave
# PATH="/Library/Frameworks/Python.framework/Versions/2.7/bin:${PATH}"
export PATH

# Setting PATH for Python 3.4
# The orginal version is saved in .bash_profile.pysave
# PATH="/Library/Frameworks/Python.framework/Versions/3.4/bin:${PATH}"
export PATH

# Setting PATH for Python 3.4
# The orginal version is saved in .bash_profile.pysave
# PATH="/Library/Frameworks/Python.framework/Versions/3.4/bin:${PATH}"
export PATH

# Setting PATH for Python 3.4
# The orginal version is saved in .bash_profile.pysave
# PATH="/Library/Frameworks/Python.framework/Versions/3.4/bin:${PATH}"
export PATH


export PATH="$PATH:/Applications/DevDesktop/drush"

# export PATH=$PATH:/usr/local/bin

#. ~/.nvm/nvm.sh

[[ -s "$HOME/.rvm/scripts/rvm" ]] && source "$HOME/.rvm/scripts/rvm" # Load RVM into a shell session *as a function*

export PATH=$PATH:/Applications/Postgres.app/Contents/Versions/latest/bin

export PATH=$PATH:/Users/hjalmarjakobsson/bin


# if [ -f ~/.git-completion.bash ]; then 
#     source ~/.git-completion.bash
# fi


export PATH=$PATH:/Users/hjalmarjakobsson/Library/Android/sdk/platform-tools:/Users/hjalmarjakobsson/Library/Android/sdk/tools:/Users/hjalmarjakobsson/Library/Android/sdk/build-tools/24.0.3

# mongodb
export PATH=$PATH:/usr/local/Cellar/mongodb-community/4.2.0/bin/mongod
export PATH=$PATH:/Users/hjalmarjakobsson/data/db

# MySQL
export PATH=$PATH:/usr/local/mysql/bin
export PATH=$PATH:/usr/local/mysql/support-files

## nvm issue
#export NVM_DIR=~/.nvm
#source ~/.nvm/nvm.sh

# OLD BASH PROFILE ENDS








# OLD BASH RC STARTS

export PATH=/usr/local/bin:/usr/local/sbin:$PATH


# source ~/.bash_git
# source ~/.git-completion.bash
# test -f ~/.git-completion.bash && . $_
# source usr/local/etc/bash_completion.d/git
# source /usr/local/etc/bash_completion.d/git-prompt.sh

export PATH="$PATH:/Applications/DevDesktop/drush"

export NVM_DIR="/Users/hjalmarjakobsson/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && . "$NVM_DIR/nvm.sh"  # This loads nvm

export PATH="$PATH:$HOME/.rvm/bin" # Add RVM to PATH for scripting


# export PATH="$PATH:$HOME/Library/Python/3.7/bin"


# OLD BASH RC ENDS





ZSH_DISABLE_COMPFIX="true"
#
# If colorls command does not work
#   https://stackoverflow.com/questions/46377667/docker-for-mac-mkmf-rb-cant-find-header-files-for-ruby
#   https://stackoverflow.com/questions/54818827/install-colorls-on-macos-and-zsh


# Include bash
#   eg. if you migrate from bash to zsh you might have to include your
#   previous bash configs in order for commands such as `ls` to work.
#
#   bash was the old default shell in MacOS but recently zsh has become
#   the default on new machines. Therefore you might need to source bash
#   if you upgraded from bash to zsh.

# set path for qmk CLI install
export QMK_HOME=/Users/hjalmarjakobsson/Sites/zsa_qmk_fork

# latex / mactex path
export PATH="/usr/local/texlive/2019/bin/x86_64-darwin:$PATH"

#export PATH="/usr/local/opt/ruby/bin:$PATH"
export PATH="$PATH:/Users/hjalmarjakobsson/.gem/ruby/2.7.0"
#export GEM_HOME=$HOME/.gem
#export GEM_PATH=$HOME/.gem



# source ~/.profile
source ~/.bash_profile

# Path to oh-my-zsh installation.
export ZSH=~/.oh-my-zsh

# Name of the theme to load.
# Look in ~/.oh-my-zsh/themes/
ZSH_THEME="powerlevel9k/powerlevel9k"

# TMUX
# Automatically start tmux
ZSH_TMUX_AUTOSTART=true

# Automatically connect to a previous session if it exists
ZSH_TMUX_AUTOCONNECT=true

# Enable command auto-correction.
ENABLE_CORRECTION="true"

# Display red dots whilst waiting for completion.
COMPLETION_WAITING_DOTS="true"

# Disable marking untracked files
# under VCS as dirty. This makes repository status check for large repositories
# much, much faster.
DISABLE_UNTRACKED_FILES_DIRTY="true"

# Which plugins would you like to load? (plugins can be found in ~/.oh-my-zsh/plugins/*)
# Custom plugins may be added to ~/.oh-my-zsh/custom/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
# Add wisely, as too many plugins slow down shell startup.
plugins=(git node brew tmux)

# User configuration
# Hide user@hostname if it's expected default user
DEFAULT_USER="ctay20"
prompt_context(){}

# Setting rg as the default source for fzf
export FZF_DEFAULT_COMMAND='rg --files'

# Apply the command to CTRL-T as well
export FZF_CTRL_T_COMMAND="$FZF_DEFAULT_COMMAND"

# Set location of z installation
. /usr/local/etc/profile.d/z.sh

## FZF FUNCTIONS ##

# fo [FUZZY PATTERN] - Open the selected file with the default editor
#   - Bypass fuzzy finder if there's only one match (--select-1)
#   - Exit if there's no match (--exit-0)
#
#   this is how you create functions in/for the terminal
#     see keycommands.md
fo() {
  local files
  IFS=$'\n' files=($(fzf-tmux --query="$1" --multi --select-1 --exit-0))
  [[ -n "$files" ]] && ${EDITOR:-vim} "${files[@]}"
}

# fh [FUZZY PATTERN] - Search in command history
fh() {
  print -z $( ([ -n "$ZSH_NAME" ] && fc -l 1 || history) | fzf +s --tac | sed 's/ *[0-9]* *//')
}

# fbr [FUZZY PATTERN] - Checkout specified branch
# Include remote branches, sorted by most recent commit and limited to 30
fgb() {
  local branches branch
  branches=$(git for-each-ref --count=30 --sort=-committerdate refs/heads/ --format="%(refname:short)") &&
  branch=$(echo "$branches" |
           fzf-tmux -d $(( 2 + $(wc -l <<< "$branches") )) +m) &&
  git checkout $(echo "$branch" | sed "s/.* //" | sed "s#remotes/[^/]*/##")
}

# tm [SESSION_NAME | FUZZY PATTERN] - create new tmux session, or switch to existing one.
# Running `tm` will let you fuzzy-find a session mame
# Passing an argument to `ftm` will switch to that session if it exists or create it otherwise
ftm() {
  [[ -n "$TMUX" ]] && change="switch-client" || change="attach-session"
  if [ $1 ]; then
    tmux $change -t "$1" 2>/dev/null || (tmux new-session -d -s $1 && tmux $change -t "$1"); return
  fi
  session=$(tmux list-sessions -F "#{session_name}" 2>/dev/null | fzf --exit-0) &&  tmux $change -t "$session" || echo "No sessions found."
}

# tm [SESSION_NAME | FUZZY PATTERN] - delete tmux session
# Running `tm` will let you fuzzy-find a session mame to delete
# Passing an argument to `ftm` will delete that session if it exists
ftmk() {
  if [ $1 ]; then
    tmux kill-session -t "$1"; return
  fi
  session=$(tmux list-sessions -F "#{session_name}" 2>/dev/null | fzf --exit-0) &&  tmux kill-session -t "$session" || echo "No session found to delete."
}

# fuzzy grep via rg and open in vim with line number
fgr() {
  local file
  local line

  read -r file line <<<"$(rg --no-heading --line-number $@ | fzf -0 -1 | awk -F: '{print $1, $2}')"

  if [[ -n $file ]]
  then
     vim $file +$line
  fi
}

# Enabled zsh-autosuggestions
source ~/.zsh/zsh-autosuggestions/zsh-autosuggestions.zsh

# Set default editor to nvim
export EDITOR='nvim'

# show when running in a shell spawned by ranger.
if [ -n "$RANGER_LEVEL" ]; then export PS1="[ranger]$PS1"; fi

# Enabled true color support for terminals
export NVIM_TUI_ENABLE_TRUE_COLOR=1

# Aliases
alias v="nvim"
alias top="vtop --theme=wizard"
alias ls="colorls -lA --sd"

alias rzsh="source ~/.zshrc"
alias rbashp="source ~/.bash_profile"
alias rbashrc="source ~/.bashrc"
alias rprof="source ~/.profile"
# meant to be run in qmk root dir to build keyboard
alias tfl="teensy_loader_cli -mmcu=atmega32u4 -w ergodox_ez_myergo.hex"

alias k="clear"
alias r="ranger"

source $ZSH/oh-my-zsh.sh

# iterm title bar color
# https://codematters.blog/custom-iterm2-titlebar-background-colors-a088c6f2ec60
# echo -e "\033]6;1;bg;red;brightness;40\a"
# echo -e "\033]6;1;bg;green;brightness;44\a"
# echo -e "\033]6;1;bg;blue;brightness;52\a"


# Set Spaceship as prompt
autoload -U promptinit; promptinit
prompt spaceship
SPACESHIP_PACKAGE_SHOW=false
SPACESHIP_NODE_SHOW=false
SPACESHIP_GIT_STATUS_STASHED=''
