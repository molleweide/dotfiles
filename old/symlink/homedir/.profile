export PATH="$PATH:$HOME/.rvm/bin" # Add RVM to PATH for scripting
[[ -s "$HOME/.rvm/scripts/rvm" ]] && source "$HOME/.rvm/scripts/rvm" # Load RVM into a shell session *as a function*
#PATH="/Applications/Postgres.app/Contents/Versions/9.5/bin:$PATH"

# mactex > context > mtxrun util script
export PATH="/usr/local/texlive/2019/bin/x86_64-darwin:$PATH"

export PATH="$HOME/Library/Python/3.7/bin:$PATH"

#
# GIT FILES are located in /usr/local/git/
#

#source /usr/local/git/contrib/completion/git-completion.bash
#source /usr/local/git/contrib/completion/git-prompt.sh

#
#

# git tab completion (homebrew)
#if [ -f `brew --prefix`/etc/bash_completion.d/git-completion.bash ]; then
#    . `brew --prefix`/etc/bash_completion.d/git-completion.bash
#fi

if [ -f ~/.git-completion.bash ]; then 
    source ~/.git-completion.bash
fi


source "$HOME/.cargo/env"
