export DISABLE_AUTO_TITLE="true"
setopt AUTO_CD
setopt AUTO_PUSHD
setopt PROMPT_SUBST

function zplugin() {
  source $HOME/.zsh/plugins/$1
}

zplugin history
zplugin completion
zplugin autojump
zplugin git
zplugin nvm-auto
zplugin reload
zplugin ssh-agent
zplugin vi-mode
zplugin fast-syntax-highlighting
zplugin zsh-history-substring-search

for file in $HOME/.zsh/custom/**/*.zsh
do
  source $file
done

eval "$(direnv hook zsh)"

export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && . "$NVM_DIR/nvm.sh"  # This loads nvm

[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

export PATH="$HOME/.rvm/bin:$PATH" # Add RVM to PATH for scripting
[[ -s "$HOME/.rvm/scripts/rvm" ]] && source "$HOME/.rvm/scripts/rvm"
