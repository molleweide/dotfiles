autoload -U add-zsh-hook

nvm_auto_switch() {
  local NVM_RC_VERSION
  local REAL_VERSION
  local NVMRC_LOCATION=$(nvm_find_nvmrc)

  if [ "$NVMRC_LOCATION" == "" ]; then
    return 0
  fi

  read NVM_RC_VERSION < $(nvm_find_nvmrc)
  REAL_VERSION=$(nvm_version $NVM_RC_VERSION) 
  [ "$(nvm_version_path $REAL_VERSION)/bin" == "$NVM_BIN" ] || nvm use
}

add-zsh-hook -Uz chpwd (){ nvm_auto_switch; }
