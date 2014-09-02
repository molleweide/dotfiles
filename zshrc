source $HOME/.zsh/antigen.zsh

antigen use oh-my-zsh

# Tool completion/aliases
antigen bundle git
antigen bundle rails
antigen bundle ruby
antigen bundle rvm
antigen bundle zeus

# Functionality diffs
antigen bundle vi-mode
antigen bundle command-not-found
antigen bundle zsh-users/zsh-syntax-highlighting

antigen theme simple

antigen apply

for file in $HOME/.zsh/custom/**/*.zsh
do
  source $file
done

source $HOME/.zsh/after.zsh
