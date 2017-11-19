alias vim="nvim"

alias l="ls -al"
alias tn="rvm default do tmuxinator"
alias tk="tmux kill-session"
alias work="cd ~/code/boundless && tn start boundless"
alias word="cd ~/code/boundless && tn start wordpress"

alias b="aid begin"

# Simple rsync
alias srync="rsync -vrazh"

alias G="spotify play uri https://open.spotify.com/track/1F9bmLBJ8VpXVadlxjafKM > /dev/null"

ctags_refresh() {
  ctags -R .
  ctags -R -f ./.git/tags
}

sslcert() {
  echo | openssl s_client -showcerts -servername $1 -connect $1:443 2>/dev/null | openssl x509 -inform pem -noout -text
}
