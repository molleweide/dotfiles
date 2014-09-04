export DISABLE_AUTO_TITLE="true"
setopt AUTO_PUSHD

source $HOME/.zsh/antigen.zsh

antigen use oh-my-zsh

# Tool completion/aliases
antigen bundle git
antigen bundle rails
antigen bundle ruby
antigen bundle rvm
antigen bundle zeus

antigen bundle ssh-agent

# Functionality diffs
antigen bundle autojump
antigen bundle command-not-found
antigen bundle emoji-clock
antigen bundle fasd
antigen bundle vi-mode
antigen bundle zsh-users/zsh-syntax-highlighting

# Add src() command to reload zshrc
antigen bundle zsh_reload

# Use my custom theme gist
antigen theme https://gist.github.com/51dba9c555e680d7e883.git dbalatero

antigen apply

for file in $HOME/.zsh/custom/**/*.zsh
do
  source $file
done

source $HOME/.zsh/after.zsh
