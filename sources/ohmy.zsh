if test -z "${XDG_CACHE_HOME-}"; then
[ ! -d ${XDG_CACHE_HOME-}/zsh/zcustom/cache ] && \
    mkdir -p "${XDG_CACHE_HOME:-$HOME/.cache}/zsh/zcustom/cache"
fi


export ZSH="${XDG_DATA_HOME:-$HOME/.local/share}/zsh/zcustom"
export ZSH_CACHE_DIR="$ZSH/cache"
