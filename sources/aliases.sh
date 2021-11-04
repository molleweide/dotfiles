# SHELL
alias ralias="source $DOROTHY/user/sources/aliases.sh"
alias xxx="exec zsh"
alias k="clear"
alias mm="man man"
alias tt="ttyper"

# alias dbm="rake db:migrate && RAILS_ENV=test rake db:migrate"
alias j=z # I'm used to autojump 'j' vs fasd 'z'
alias less="less -r"
# alias sketch="magick $1 \( -clone 0 -negate -blur 0x5 \) -compose colordodge -composite -modulate 100,0,100 -auto-level $2"
# alias srync="rsync -vrazh"
# alias emacs="TERM=xterm-24bit emacs -nw"
alias cl="calcurse"

alias duu="diskutil" # list commands
alias dul="diskutil list" # list drives

alias pstf="personal-stuff"

# ======== TILING ========
alias rst="reload_tiling"
function reload_tiling() {
    brew services restart yabai
    brew services restart skhd
    limelight # there is a wierd err msg but it works...
}

# ======== FIND FILES ========

# https://egeek.me/2020/04/18/enabling-locate-on-osx/
if which glocate > /dev/null; then
  alias locate="glocate -d $HOME/locatedb"
  [[ -f "$HOME/locatedb" ]] && export LOCATE_PATH="$HOME/locatedb"
fi
alias loaddb="gupdatedb --localpaths=$HOME --prunepaths=/Volumes --output=$HOME/locatedb"


# ======== FINANCE ===========
alias ei="cointop"


# ======== SPREADSHEET ===========
alias scm="sc-im"
alias scml=~/.local/bin/sc-im


# tmux
alias tm="tmux"
alias tk="tmux kill-session"
alias tn="tmuxinator"

# ======== DOCKER ===========

# ======== FILE MANAGERS ===========

alias fh="fff"
alias fj="lf"
alias fk="ranger"
alias fn="nnn"

function ranger {
    local IFS=$'\t\n'
    local tempfile="$(mktemp -t tmp.XXXXXX)"
    local ranger_cmd=(
        command
        ranger
        --cmd="map Q chain shell echo %d > "$tempfile"; quitall"
    )

    ${ranger_cmd[@]} "$@"
    if [[ -f "$tempfile" ]] && [[ "$(cat -- "$tempfile")" != "$(echo -n `pwd`)" ]]; then
        cd -- "$(cat "$tempfile")" || return
    fi
    command rm -f -- "$tempfile" 2>/dev/null
}

# ======== VIM ALIASES ===========

alias vim="nvim"
alias v="nvim"
alias vf="nvim -t" # search for tag
alias vr="nvim -R"
alias vh="nvim -headless"
alias vNN="nvim -u NONE"
alias vNC="nvim -u NORC"
alias vh="nvim -headless"
alias vp="nvim --cmd \"set rtp+=\$(pwd)\""

# my fork
alias vv="~/code/neovim/build/bin/nvim" # forked build

# ======== GIT ========
alias gcfls="git conflicts"
alias m="git checkout molleweide"
alias M="git checkout molldev"

alias lg="lazygit"


# 1 = branch, 2 = sub path, 3 = new repo url
alias gbrkout="git-subdir-make-into-module"
alias gsmv="git-submodule-mv"

# CHAT
alias sg="gurk" # signal
# alias sg="gurk" # siggo has better support than gurk
alias nt="neomutt" # email
# tg for telegram is default..
# discord

# ======== QMK ========
alias tfl="teensy_loader_cli -mmcu=atmega32u4 -w ergodox_ez_molleweide.hex"

# ======== DOCKER ========
alias dk="docker"
alias dkc="docker-compose"
alias dkwp="docker-compose run --rm wpcli"

# ======== KARABINER ========
alias karb="/Library/Application\ Support/org.pqrs/Karabiner-Elements/bin/karabiner_cli"
alias krb="open -a /Applications/Karabiner-Elements.app"

# ======== KMONAD ========
kmonad=~/.local/bin/kmonad
layouts=~/code/tools/kmonad/keymap/user/molleweide
kmopro()  { sudo $kmonad $layouts/macbook_pro_2012.kbd; }
kmoair()  { sudo $kmonad $layouts/macbook_air_2021_m1.kbd; }
kmoez()   { sudo $kmonad $layouts/ergodox_ez.kbd; }
kmoproT() { sudo $kmonad $layouts/macbook_pro_2012.kbd      -l debug; }
kmoairT() { sudo $kmonad $layouts/macbook_air_2021_m1.kbd   -l debug; }
kmoezT()  { sudo $kmonad $layouts/ergodox_ez.kbd            -l debug; }


# ======== GAMES ========

# ======== MUSIC & VIDEO ========
alias yt="mpsyt"

# ======== GPG ========
alias gpglk="gpg --list-keys"
alias gpglkp="gpg --list-public-keys"
alias gpglks="gpg --list-secret-keys"
alias gpge="gpg --edit-keys"

# ======== HASKELL ===========
alias rh="runhaskell"


# OS X apps
alias md="open -a Markoff $@"

# Git
function fco() {
  git checkout $(git branch -a --sort=-committerdate | \
      cut -c 3- | \
      sed 's/^remotes\/[^/]*\///' | \
      sort | \
      uniq | \
      grep -v HEAD | \
      fzf-tmux -d 20)
}

function pgrefresh() {
  rm -fr /usr/local/var/postgres/postmaster.pid
  brew services restart postgresql
}

function sslcert() {
  echo | \
    openssl s_client -showcerts -servername $1 -connect $1:443 2>/dev/null | \
    openssl x509 -inform pem -noout -text
}

function cheat() {
  curl cht.sh/$1
}

function opendir() {
  local file="$1"
  local dir=$(dirname "$file")

  open "$dir"
}

function krbcp() {
  # this works but if can take a while before the settings update.
  # force update by deselecting and then selecting the mod again.
  make
  cp public/json/molleweide.json ~/.config/karabiner/assets/complex_modifications
}

## FZF FUNCTIONS ## OLD START ##

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
fz() {
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

## FZF FUNCTIONS ## OLD END ##


slp() {
  osascript -e 'tell application "Finder" to sleep'
}





#############################################################
#############################################################
#############################################################
#############################################################
#############################################################
#############################################################
#############################################################





# ### aliases ---------------------------------------------------------------- {{{
# # https://medium.com/@webprolific/getting-started-with-dotfiles-43c3602fd789#.vh7hhm6th
# # https://github.com/webpro/dotfiles/blob/master/system/.alias
# # https://github.com/mathiasbynens/dotfiles/blob/master/.aliases

# zsh only aliases
if [[ -n ${ZSH_VERSION-} ]]; then
  alias 1='cd -'
  alias 2='cd -2'
  alias 3='cd -3'
  alias 4='cd -4'
  alias 5='cd -5'
  alias 6='cd -6'
  alias 7='cd -7'
  alias 8='cd -8'
  alias 9='cd -9'

  alias    ..='cd ..'
  alias -g ..2='../..'
  alias -g ..3='../../..'
  alias -g ..4='../../../..'
  alias -g ..5='../../../../..'
  alias -g ...='../..'
  alias -g ....='../../..'
  alias -g .....='../../../..'
  alias -g ......='../../../../..'

  alias zshrc='$VISUAL "${ZDOTDIR:-$HOME}"/.zshrc'
  alias reload='source "${ZDOTDIR:-$HOME}"/.zshrc'
  alias zbench='export LAZY_PROMPT=false; for i in $(seq 1 10); do; /usr/bin/time zsh -i -c exit; done; unset LAZY_PROMPT'
  alias zdot='cd $ZDOTDIR'

  # zsh pipes
  alias -g H='| head'
  alias -g T='| tail'
  alias -g G='| grep -E'
  alias -g S='| sort'
  alias -g L='| less'
  alias -g M='| more'
fi

# # mask built-ins with better defaults
# # alias cp='cp -i'
# # alias mv='mv -i'
# # alias rm='rm -i'
# alias ls='ls -GF'
# alias grep='grep --color=auto --exclude-dir={.bzr,CVS,.git,.hg,.svn}'
# alias ping='ping -c 5'

# # be safe
# alias cpi='cp -i'
# alias mvi='mv -i'
# alias rmi='rm -i'

# # single character shortcuts - be sparing!
# alias _='sudo'
# alias c='clear'
alias d='dirs -v | head -10'
# alias v='vim'
alias h='history'

# # shortcuts
# alias vi='vim'
# alias nv='nvim'
# alias afind='ack -il'
alias md='mkdir -p'
alias rd=rmdir
# alias please=sudo
alias po=popd
alias pu=pushd
# alias globurl='noglob urlglobber '
alias ZZ=exit

# # more ways to ls
alias ll='ls -lFh'
# alias l='ls -F'
alias drs="dirs -v"
alias l="ls -la"
alias la='ls -lAFh'
alias ldot='ls -ld .*'

# fix typos
alias quit='exit'

# tools
alias te="${EDITOR-}"
alias ide="${VISUAL-}"

# # network
# alias ip="dig +short myip.opendns.com @resolver1.opendns.com"
# alias iplocal="ifconfig | grep -Eo 'inet (addr:)?([0-9]*\.){3}[0-9]*' | grep -Eo '([0-9]*\.){3}[0-9]*' | grep -v '127.0.0.1'"
# alias dnsflush="dscacheutil -flushcache && killall -HUP mDNSResponder"
alias speedtest="wget -O /dev/null http://speed.transip.nl/10mb.bin"
# alias pinging="command ping"

# # other aliases
# alias tarls="tar -tvf"
# alias untar="tar -xf"
# alias biggest='du -s ./* | sort -nr | awk '\''{print $2}'\'' | xargs du -sh'
# alias dux='du -x --max-depth=1 | sort -n'
# alias path='echo -e ${PATH//:/\\n}'
# alias linecount="grep -c '^'"
# alias ds="date +%Y%m%d"
# alias ts="date +%Y%m%d%H%M%S"
# alias timestamp="date '+%Y-%m-%d %H:%M:%S'"
# alias datestamp="date '+%Y-%m-%d'"
# alias fd='find . -type d -name'
# alias ff='find . -type f -name'
# alias dud='du -d 1 -h'
# alias duf='du -sh *'

# # auto-orient images based on exif tags
# alias autorotate="jhead -autorot"
