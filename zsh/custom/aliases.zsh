# Shell aliases
# alias rzsh="source ~/.zshrc"
alias k="clear"
alias mm="man man"
alias drs="dirs -v"
alias r="ranger"
alias gcfls="git conflict"
alias M="git checkout master"
alias m="git checkout molleweide"
alias dbm="rake db:migrate && RAILS_ENV=test rake db:migrate"
alias l="ls -al"
alias j=z # I'm used to autojump 'j' vs fasd 'z'
alias less="less -r"
alias sketch="magick $1 \( -clone 0 -negate -blur 0x5 \) \
  -compose colordodge -composite -modulate 100,0,100 -auto-level $2"
alias srync="rsync -vrazh"
alias tk="tmux kill-session"
alias tn="tmuxinator"
alias emacs="TERM=xterm-24bit emacs -nw"
alias vim="nvim"
alias v="nvim"
alias 6="exec zsh"


# karabiner path
alias karb="/Library/Application\ Support/org.pqrs/Karabiner-Elements/bin/karabiner_cli"



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

## FZF FUNCTIONS ## OLD END ##

