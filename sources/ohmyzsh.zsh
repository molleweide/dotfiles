[ ! -d $XDG_CACHE_HOME/zsh/zcustom/cache ] && \
    mkdir -p $XDG_CACHE_HOME/zsh/zcustom/cache

export ZSH="${XDG_DATA_HOME:-$HOME/.local/share}/zsh/zcustom"
export ZSH_CACHE_DIR="$ZSH/cache"
