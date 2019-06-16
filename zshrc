export DISABLE_AUTO_TITLE="true"
setopt AUTO_PUSHD
setopt PROMPT_SUBST

if [ -z "$HISTFILE" ]; then
  HISTFILE=$HOME/.zsh_history
fi

HISTSIZE=10000
SAVEHIST=10000

setopt append_history
setopt extended_history
setopt hist_expire_dups_first
setopt hist_ignore_dups # ignore duplication command history list
setopt hist_ignore_space
setopt inc_append_history
setopt share_history # share command history data
setopt extended_glob

# Allow extended matchers like ^file, etc
set -o EXTENDED_GLOB

fpath=(/usr/local/share/zsh-completions $fpath)
fpath=($HOME/.zsh/functions $fpath)

# The following lines were added by compinstall
zstyle ':completion:*' completer _complete _ignored
zstyle :compinstall filename '/Users/dbalatero/.zshrc'

autoload -Uz compinit
compinit
# End of lines added by compinstall

for file in $HOME/.zsh/plugins/**/*.zsh
do
  source $file
done

for file in $HOME/.zsh/custom/**/*.zsh
do
  source $file
done

for file in $HOME/.zsh/secrets/**/*.zsh
do
  source $file
done

[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

# Add RVM to PATH for scripting. Make sure this is the last
# PATH variable change.
export PATH="$HOME/.rvm/bin:$PATH"
[ -f ~/.rvm/scripts/rvm ] && source ~/.rvm/scripts/rvm
