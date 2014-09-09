ms() { bash -c "cd ~/code/mariners && ./scoreboard $@" }

alias dbm="rake db:migrate"
alias ole="bin/open_last_error"

ctags_refresh() {
  ctags -R .
  ctags -R -f ./.git/tags
}
