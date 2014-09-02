source $HOME/.zsh/antigen.zsh

antigen use oh-my-zsh

antigen bundle git
antigen bundle command-not-found
antigen bundle zsh-users/zsh-syntax-highlighting

antigen theme simple

antigen apply

export PATH="/usr/local/bin:$PATH:$HOME/.rvm/bin" # Add RVM to PATH for scripting
