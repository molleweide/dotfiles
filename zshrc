source $HOME/.zsh/antigen.zsh

antigen use oh-my-zsh

# Tool completion/aliases
antigen bundle git
antigen bundle rails
antigen bundle ruby
antigen bundle rvm
antigen bundle tmux
antigen bundle zeus

# Functionality diffs
antigen bundle command-not-found
antigen bundle vi-mode
antigen bundle zsh-users/zsh-syntax-highlighting

# Add src() command to reload zshrc
antigen bundle zsh_reload

antigen theme simple

antigen apply

for file in $HOME/.zsh/custom/**/*.zsh
do
  source $file
done

source $HOME/.zsh/after.zsh
