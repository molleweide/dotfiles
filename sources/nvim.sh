
    # `v` / `vh` / `vdock`




# alias vi='vim'
# alias nv='nvim'

#-----------------------------
#---       VIM STUFF       ---
#-----------------------------

# RUN VIM

# Use neovim for vim if present.
[ -x "$(command -v nvim)" ] && alias vim="nvim" vimdiff="nvim -d"
alias vim="nvim"
alias v="nvim"
alias vv="~/code/neovim/build/bin/nvim" # forked build
alias vf="nvim -t" # search for tag
alias vr="nvim -R"
alias vh="nvim -headless"
alias vNN="nvim -u NONE"
alias vNC="nvim -u NORC"
alias vh="nvim -headless"
alias vp="nvim --cmd \"set rtp+=\$(pwd)\""


