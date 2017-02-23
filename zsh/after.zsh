eval "$(direnv hook zsh)"
source $(brew --prefix autoenv)/activate.sh

export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && . "$NVM_DIR/nvm.sh"  # This loads nvm

export PATH="$HOME/.rvm/bin:$PATH" # Add RVM to PATH for scripting
source ~/.rvm/scripts/rvm
