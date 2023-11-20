# PURE_PROMPT_SYMBOL="%%"

# https://github.com/ohmyzsh/ohmyzsh/tree/master/plugins
# https://travis.media/top-10-oh-my-zsh-plugins-for-productive-developers/

# if test -f "$ADOTDIR/antigen.zsh"; then



source "$ADOTDIR/antigen.zsh"

# remove bundle with: antigen purge <bundle>
ANTIGEN_PLUGINS=(
git
nvm
pyenv
rvm
vi-mode
dbalatero/fzf-git
DarrinTisdale/zsh-aliases-exa
chriskempson/base16-shell
wookayin/fzf-fasd
# rupa/z z.sh
twang817/zsh-ssh-agent
zsh-users/zsh-completions
zdharma/fast-syntax-highlighting
hlissner/zsh-autopair
)

function antigen_install() {
  for f in "${ANTIGEN_PLUGINS[@]}"; do
    antigen bundle "$f"
  done
  antigen apply
}

[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

eval "$(direnv hook zsh)"

if command-exists fasd; then
  eval "$(fasd --init auto)"
else
  antigen_install
fi

# fi
