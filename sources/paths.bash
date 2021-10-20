#!/usr/bin/env bash

# https://github.com/HaleTom/dotfiles/blob/master/bash/.config/bash/xdg
# echo_and_eval_var_set DOTFILES “$HOME/.dorothy/user”

echo_and_eval_var_set DOTFILES "$HOME/dorothy/user"
echo_and_eval_var_set XDG_CACHE_HOME "$HOME/.cache"
echo_and_eval_var_set XDG_CONFIG_HOME "$HOME/.config"
echo_and_eval_var_set XDG_DATA_HOME "$HOME/.local/share"
echo_and_eval_var_set XDG_STATE_HOME "$HOME/.local/state"

if is-mac; then
  echo_and_eval_var_set XDG_DESKTOP_DIR "$HOME/Desktop"
  echo_and_eval_var_set XDG_DOCUMENTS_DIR "$HOME/Documents"
  echo_and_eval_var_set XDG_DOWNLOAD_DIR "$HOME/Downloads"
  echo_and_eval_var_set XDG_MUSIC_DIR "$HOME/Music"
  echo_and_eval_var_set XDG_PICTURES_DIR "$HOME/Pictures"
  echo_and_eval_var_set XDG_VIDEOS_DIR "$HOME/Videos"
fi

echo_and_eval_var_set ADOTDIR "$XDG_DATA_HOME/antigen"
echo_and_eval_var_set ALSA_CONFIG_PATH "$XDG_CONFIG_HOME/alsa/asoundrc"
echo_and_eval_var_set ANDROID_SDK_HOME "$XDG_CONFIG_HOME/android"
echo_and_eval_var_set ANSIBLE_CONFIG "$XDG_CONFIG_HOME/ansible/ansible.cfg"
echo_and_eval_var_set ANTIGEN_COMPDUMP "${ADOTDIR}/.zcompdump"
echo_and_eval_var_set ANTIGEN_DEBUG_LOG "${ADOTDIR}/antigen_debug.log"
echo_and_eval_var_set ANTIGEN_LOG "${ADOTDIR}/antigen.log"
echo_and_eval_var_set ANTIGEN_BUNDLES "${ADOTDIR}/bundles"
echo_and_eval_var_set CABAL_CONFIG "$XDG_CONFIG_HOME/cabal/config"
echo_and_eval_var_set CABAL_DIR "$XDG_CACHE_HOME/cabal"
echo_and_eval_var_set CARGO_HOME "$XDG_DATA_HOME/cargo"
echo_and_eval_var_set RUSTUP_HOME "$XDG_DATA_HOME/rustup"
echo_and_eval_var_set ELECTRUMDIR "$XDG_DATA_HOME/electrum"
echo_and_eval_var_set GEM_HOME "$XDG_DATA_HOME/gem"
echo_and_eval_var_set GEM_SPEC_CACHE "$XDG_CACHE_HOME/gem"
echo_and_eval_var_set GNUPGHOME "$XDG_DATA_HOME/gnupg"
echo_and_eval_var_set GOPATH "$XDG_DATA_HOME/go"
echo_and_eval_var_set GTK2_RC_FILES "$XDG_CONFIG_HOME/gtk-2.0/gtkrc-2.0"
echo_and_eval_var_set HISTFILE "$XDG_DATA_HOME/history"
echo_and_eval_var_set INPUTRC "$XDG_CONFIG_HOME/readline/inputrc"
echo_and_eval_var_set IRBRC "$XDG_CONFIG_HOME/irb/irbrc"
echo_and_eval_var_set KODI_DATA "$XDG_DATA_HOME/kodi"
echo_and_eval_var_set LESSHISTFILE "-"
echo_and_eval_var_set MBSYNCRC "$XDG_CONFIG_HOME/mbsync/config"
echo_and_eval_var_set NOTMUCH_CONFIG "$XDG_CONFIG_HOME/notmuch-config"
echo_and_eval_var_set NPM_CONFIG_USERCONFIG "$XDG_CONFIG_HOME/npm/npmrc"
echo_and_eval_var_set NVM_DIR "$XDG_DATA_HOME/nvm"
echo_and_eval_var_set OCTAVE_HISTFILE "$XDG_CACHE_HOME/octave-hsts"
echo_and_eval_var_set PASSWORD_STORE_DIR "$XDG_DATA_HOME/password-store"
echo_and_eval_var_set PYENV_ROOT "$XDG_DATA_HOME/pyenv"
echo_and_eval_var_set STACK_ROOT "$XDG_DATA_HOME/stack"
# echo_and_eval_var_set TMUX_TMPDIR "$XDG_RUNTIME_DIR"
echo_and_eval_var_set TMUX_PLUGIN_MANAGER_PATH "$XDG_CONFIG_HOME/tmux/plugins"
echo_and_eval_var_set UNISON "$XDG_DATA_HOME/unison"
echo_and_eval_var_set WEECHAT_HOME "$XDG_CONFIG_HOME/weechat"
echo_and_eval_var_set WGETRC "$XDG_CONFIG_HOME/wget/wgetrc"
echo_and_eval_var_set WINEPREFIX "$XDG_DATA_HOME/wineprefixes/default"
# echo_and_eval_var_set XAUTHORITY "$XDG_RUNTIME_DIR/Xauthority" # This line will break some DMs.
echo_and_eval_var_set XINITRC "$XDG_CONFIG_HOME/x11/xinitrc"
echo_and_eval_var_set ZDOTDIR "$XDG_CONFIG_HOME/zsh"

if test "$login_shell" = 'zsh'; then
	echo_and_eval_var_set HISTFILE "$XDG_STATE_HOME/zsh/history"
fi
