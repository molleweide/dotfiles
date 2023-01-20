
    # `v` / `vh` / `vdock`




# alias vi='vim'
# alias nv='nvim'

#-----------------------------
#---       VIM STUFF       ---
#-----------------------------

# RUN VIM

# Use neovim for vim if present.
[ -x "$(command -v nvim)" ] && alias vim="nvim" vimdiff="nvim -d"

# versions managed by bob
alias v="CC=gcc-12 ~/.local/share/neovim/bin/nvim"
alias vc="CC=/usr/local/Cellar/gcc/12.2.0/bin/gcc-12 ~/.local/share/neovim/bin/nvim"

# brew version
alias vim="nvim"
alias vb="nvim"
alias vf="nvim -t" # search for tag
alias vr="nvim -R"
alias vh="nvim -headless"
alias vNN="nvim -u NONE"
alias vNC="nvim -u NORC"
alias vh="nvim -headless"
alias vp="nvim --cmd \"set rtp+=\$(pwd)\""


# build from source
alias vv="~/code/repos/github.com/neovim/neovim/build/bin/nvim" # forked build

# # create plugin from template / requires boilit
# alias nvp="boilit -p $HOME/code/plugins/nvim"
