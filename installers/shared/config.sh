function dotfiles_config_set() {
  local key=$1

  [ -f ~/.config/dotfiles/$key ]
}
