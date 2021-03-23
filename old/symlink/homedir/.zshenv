# OLD BASH PROFILE STARTS

# export PS1="h$ "
export PS1='\W$(__git_ps1 "(%s)") > '

# GIT_PS1_SHOWDIRTYSTATE=true
# export PS1='[\u@mbp \w$(__git_ps1)]\$ '

source ~/.profile

export PATH=/usr/local/bin:/usr/local/sbin:~/bin:$PATH
# # Homebrew python path
# export PATH=/usr/local/bin:/usr/local/sbin:~/bin:$PATH

# Setting PATH for Python 2.7
# The orginal version is saved in .bash_profile.pysave
# PATH="/Library/Frameworks/Python.framework/Versions/2.7/bin:${PATH}"
export PATH

# Setting PATH for Python 3.4
# The orginal version is saved in .bash_profile.pysave
# PATH="/Library/Frameworks/Python.framework/Versions/3.4/bin:${PATH}"
export PATH

# Setting PATH for Python 3.4
# The orginal version is saved in .bash_profile.pysave
# PATH="/Library/Frameworks/Python.framework/Versions/3.4/bin:${PATH}"
export PATH

# Setting PATH for Python 3.4
# The orginal version is saved in .bash_profile.pysave
# PATH="/Library/Frameworks/Python.framework/Versions/3.4/bin:${PATH}"
export PATH


export PATH="$PATH:/Applications/DevDesktop/drush"

# export PATH=$PATH:/usr/local/bin

#. ~/.nvm/nvm.sh

[[ -s "$HOME/.rvm/scripts/rvm" ]] && source "$HOME/.rvm/scripts/rvm" # Load RVM into a shell session *as a function*

export PATH=$PATH:/Applications/Postgres.app/Contents/Versions/latest/bin

export PATH=$PATH:/Users/hjalmarjakobsson/bin


# if [ -f ~/.git-completion.bash ]; then 
#     source ~/.git-completion.bash
# fi


export PATH=$PATH:/Users/hjalmarjakobsson/Library/Android/sdk/platform-tools:/Users/hjalmarjakobsson/Library/Android/sdk/tools:/Users/hjalmarjakobsson/Library/Android/sdk/build-tools/24.0.3

# mongodb
export PATH=$PATH:/usr/local/Cellar/mongodb-community/4.2.0/bin/mongod
export PATH=$PATH:/Users/hjalmarjakobsson/data/db

# MySQL
export PATH=$PATH:/usr/local/mysql/bin
export PATH=$PATH:/usr/local/mysql/support-files

## nvm issue
#export NVM_DIR=~/.nvm
#source ~/.nvm/nvm.sh
<<<<<<< HEAD:symlink/homedir/.bash_profile
source "$HOME/.cargo/env"
=======

# OLD BASH PROFILE ENDS








# OLD BASH RC STARTS

export PATH=/usr/local/bin:/usr/local/sbin:$PATH


# source ~/.bash_git
# source ~/.git-completion.bash
# test -f ~/.git-completion.bash && . $_
# source usr/local/etc/bash_completion.d/git
# source /usr/local/etc/bash_completion.d/git-prompt.sh

export PATH="$PATH:/Applications/DevDesktop/drush"

export NVM_DIR="/Users/hjalmarjakobsson/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && . "$NVM_DIR/nvm.sh"  # This loads nvm

export PATH="$PATH:$HOME/.rvm/bin" # Add RVM to PATH for scripting


# export PATH="$PATH:$HOME/Library/Python/3.7/bin"


# OLD BASH RC ENDS
>>>>>>> origin/saveMainLaptopPreBalatero:symlink/homedir/.zshenv
