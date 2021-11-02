#!/usr/bin/env bash

# export NVM_DIR="$HOME/.nvm"

# choose your architecture for apple silicon
# export HOMEBREW_ARCH='x86_64' # 'arm64e'

export BROWSER="brave"
export PAGER='less' # alt. `most`
export TERMINAL="Alacritty" # or kitty | linux >> "st"

# timezone
export TZ="America/New_York"
export LANG="en_US.UTF-8"
export LANGUAGE="en"
export LC_ALL="en_US.UTF-8"

# python
is-mac && export PYTHON_CONFIGURE_OPTS="--enable-framework"
is-linux && export PYTHON_CONFIGURE_OPTS="--enable-shared"
export PYENV_VIRTUALENV_DISABLE_PROMPT=1
# echo_and_eval_var_set PATH "$PYENV_ROOT/bin:$PATH"


# https://github.com/HaleTom/dotfiles/blob/master/bash/.config/bash/xdg

# xdg
# https://wiki.archlinux.org/title/XDG_Base_Directory
export XDG_CONFIG_HOME="${XDG_CONFIG_HOME:-"$HOME/.config"}"
export XDG_CACHE_HOME="${XDG_CACHE_HOME:-"$HOME/.cache"}"
export XDG_DATA_HOME="${XDG_DATA_HOME:-"$HOME/.local/share"}"
export XDG_STATE_HOME="${XDG_STATE_HOME:-"$HOME/.local/state"}"
export XDG_DATA_DIRS="${XDG_DATA_DIRS:-"$XDG_DATA_HOME:/usr/local/share:/usr/share"}"
export XDG_CONFIG_DIRS="${XDG_CONFIG_DIRS:-"$XDG_CONFIG_HOME:/etc/xdg"}"

# mac
if is-mac; then
    export XDG_DESKTOP_DIR="$HOME/Desktop"
    export XDG_DOCUMENTS_DIR="$HOME/Documents"
    export XDG_DOWNLOAD_DIR="$HOME/Downloads"
    export XDG_MUSIC_DIR="$HOME/Music"
    export XDG_PICTURES_DIR="$HOME/Pictures"
    export XDG_VIDEOS_DIR="$HOME/Videos"
fi

export ADOTDIR="$XDG_DATA_HOME/antigen"
export ALSA_CONFIG_PATH="$XDG_CONFIG_HOME/alsa/asoundrc"
export ANDROID_SDK_HOME="$XDG_CONFIG_HOME/android"
export ANSIBLE_CONFIG="$XDG_CONFIG_HOME/ansible/ansible.cfg"
export ANTIGEN_COMPDUMP="${ADOTDIR}/.zcompdump"
export ANTIGEN_DEBUG_LOG="${ADOTDIR}/antigen_debug.log"
export ANTIGEN_LOG="${ADOTDIR}/antigen.log"
export ANTIGEN_BUNDLES="${ADOTDIR}/bundles"
export CABAL_CONFIG="$XDG_CONFIG_HOME/cabal/config"
export CABAL_DIR="$XDG_CACHE_HOME/cabal"
export CARGO_HOME="$XDG_DATA_HOME/cargo"
export RUSTUP_HOME="$XDG_DATA_HOME/rustup"
export ELECTRUMDIR="$XDG_DATA_HOME/electrum"
export GEM_HOME="$XDG_DATA_HOME/gem"
export GEM_SPEC_CACHE="$XDG_CACHE_HOME/gem"
export GNUPGHOME="$XDG_DATA_HOME/gnupg"
export GOPATH="$XDG_DATA_HOME/go"
export GTK2_RC_FILES="$XDG_CONFIG_HOME/gtk-2.0/gtkrc-2.0"
export INPUTRC="$XDG_CONFIG_HOME/readline/inputrc"
export IRBRC="$XDG_CONFIG_HOME/irb/irbrc"
export KODI_DATA="$XDG_DATA_HOME/kodi"
export MBSYNCRC="$XDG_CONFIG_HOME/mbsync/config"
export NOTMUCH_CONFIG="$XDG_CONFIG_HOME/notmuch-config"
export NPM_CONFIG_USERCONFIG="$XDG_CONFIG_HOME/npm/npmrc"
export NVM_DIR="$XDG_DATA_HOME/nvm"
export OCTAVE_HISTFILE="$XDG_CACHE_HOME/octave-hsts"
export PASSWORD_STORE_DIR="$XDG_DATA_HOME/password-store"
export PYENV_ROOT="$XDG_DATA_HOME/pyenv"
export STACK_ROOT="$XDG_DATA_HOME/stack"
# export TMUX_TMPDIR="$XDG_RUNTIME_DIR"
export TMUX_PLUGIN_MANAGER_PATH="$XDG_CONFIG_HOME/tmux/plugins"
export UNISON="$XDG_DATA_HOME/unison"
export WEECHAT_HOME="$XDG_CONFIG_HOME/weechat"
export WGETRC="$XDG_CONFIG_HOME/wget/wgetrc"
export WINEPREFIX="$XDG_DATA_HOME/wineprefixes/default"
# export XAUTHORITY="$XDG_RUNTIME_DIR/Xauthority" # This line will break some DMs.
export XINITRC="$XDG_CONFIG_HOME/x11/xinitrc"
export ZDOTDIR="$XDG_CONFIG_HOME/zsh"

export HISTFILE="$XDG_DATA_HOME/history"
export LESSHISTFILE="-"
if test "$shell" = 'zsh'; then
	export HISTFILE="$XDG_STATE_HOME/zsh/history"
    mkdir -p "$XDG_STATE_HOME/zsh"
    touch "$HISTFILE"
fi
