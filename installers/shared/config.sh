function dotfiles_config_set() {
  local key=$1

  [ -f ~/.config/dotfiles/$key ]
}

function use_rbenv() {
  dotfiles_config_set "rbenv"
}

function use_rvm() {
  ! use_rbenv
}

function use_nodenv() {
  dotfiles_config_set "no-nvm"
}

function use_nvm() {
  ! use_nodenv
}
