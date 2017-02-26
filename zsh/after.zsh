eval "$(direnv hook zsh)"
source $(brew --prefix autoenv)/activate.sh

export PATH="$HOME/.rvm/bin:$PATH" # Add RVM to PATH for scripting
