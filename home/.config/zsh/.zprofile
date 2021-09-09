#!/bin/zsh

#################################################################
# NOTE: Executes commands at login pre-zshrc.
#############################################################
# profile file. Runs on login. Environmental variables are set here.
# If you don't plan on reverting to bash, you can remove the link in ~/.profile
# to clean up.

unsetopt PROMPT_SP # i believe this removes ^% sign in prompt

echo "zprofile!!!!!!!!"

# Default programs:
export EDITOR="nvim"

# TODO: if darwin alacritty, else st
export TERMINAL="Alacritty" # or kitty | linux >> "st"
export BROWSER="brave"

#################################################################
# NOTE: XDG
#############################################################

export XDG_CACHE_HOME="$HOME/.cache"
export XDG_CONFIG_HOME="$HOME/.config"
export XDG_DATA_HOME="$HOME/.local/share"
# export XDG_RUNTIME_DIR=~/.xdg

if [[ "$OSTYPE" == darwin* ]]; then
  export XDG_DESKTOP_DIR=~/Desktop
  export XDG_DOCUMENTS_DIR=~/Documents
  export XDG_DOWNLOAD_DIR=~/Downloads
  export XDG_MUSIC_DIR=~/Music
  export XDG_PICTURES_DIR=~/Pictures
  export XDG_VIDEOS_DIR=~/Videos
fi

#################################################################
# NOTE: Browser
#############################################################


# if [[ "$OSTYPE" == darwin* ]]; then
#   export BROWSER='open'
# fi

#################################################################
# NOTE: Editors
#############################################################

export EDITOR='nvim'
# export VISUAL='code' # what is this?
export PAGER='less' # alt. `most`

#################################################################
# NOTE: Language
#############################################################

export TZ="America/New_York"
export LANG="en_US.UTF-8"
export LANGUAGE="en"
export LC_ALL="en_US.UTF-8"

#################################################################
# NOTE: Paths
#############################################################

# Adds `~/.local/bin` to $PATH
export PATH="$PATH:${$(find ~/.local/bin -type d -printf %p:)%%:}"

# Ensure path arrays do not contain duplicates.
typeset -gU cdpath fpath mailpath path

# Set the list of directories that cd searches.
# cdpath=(
#   $cdpath
# )

# Set the list of directories that Zsh searches for programs.
path=(
  ~/bin
  /usr/local/{bin,sbin}
  $path
)

#############################################################
# NOTE: XDG clean up
#############################################################

# #export XAUTHORITY="$XDG_RUNTIME_DIR/Xauthority" # This line will break some DMs.
# export ANSIBLE_CONFIG="${XDG_CONFIG_HOME:-$HOME/.config}/ansible/ansible.cfg"
# export ELECTRUMDIR="${XDG_DATA_HOME:-$HOME/.local/share}/electrum"
# export GTK2_RC_FILES="${XDG_CONFIG_HOME:-$HOME/.config}/gtk-2.0/gtkrc-2.0"
# export KODI_DATA="${XDG_DATA_HOME:-$HOME/.local/share}/kodi"
# export MBSYNCRC="${XDG_CONFIG_HOME:-$HOME/.config}/mbsync/config"
# export NOTMUCH_CONFIG="${XDG_CONFIG_HOME:-$HOME/.config}/notmuch-config"
# export UNISON="${XDG_DATA_HOME:-$HOME/.local/share}/unison"
# export WEECHAT_HOME="${XDG_CONFIG_HOME:-$HOME/.config}/weechat"
# export WINEPREFIX="${XDG_DATA_HOME:-$HOME/.local/share}/wineprefixes/default"
# export XINITRC="${XDG_CONFIG_HOME:-$HOME/.config}/x11/xinitrc"
export ALSA_CONFIG_PATH="$XDG_CONFIG_HOME/alsa/asoundrc"
export ANDROID_SDK_HOME="${XDG_CONFIG_HOME:-$HOME/.config}/android"
export CABAL_CONFIG="$XDG_CONFIG_HOME"/cabal/config
export CABAL_DIR="$XDG_CACHE_HOME"/cabal
export CARGO_HOME="${XDG_DATA_HOME:-$HOME/.local/share}/cargo"
export GEM_HOME="${XDG_DATA_HOME:-$HOME/.local/share}/gem"
export GEM_SPEC_CACHE="$XDG_CACHE_HOME/gem"
export GNUPGHOME="${XDG_DATA_HOME:-$HOME/.local/share}/gnupg"
export GOPATH="${XDG_DATA_HOME:-$HOME/.local/share}/go"
export HISTFILE="${XDG_DATA_HOME:-$HOME/.local/share}/history"
export INPUTRC="${XDG_CONFIG_HOME:-$HOME/.config}/readline/inputrc"
export LESSHISTFILE="-"
export NVM_DIR="$XDG_DATA_HOME"/nvm
export PASSWORD_STORE_DIR="${XDG_DATA_HOME:-$HOME/.local/share}/password-store"
export PYENV_ROOT="${XDG_DATA_HOME:-$HOME/.local/share}/pyenv"
export STACK_ROOT="$XDG_DATA_HOME"/stack
export TMUX_TMPDIR="$XDG_RUNTIME_DIR"
export WGETRC="${XDG_CONFIG_HOME:-$HOME/.config}/wget/wgetrc"
export ZDOTDIR="${XDG_CONFIG_HOME:-$HOME/.config}/zsh"
# export ZDOTDIR="${XDG_CONFIG_HOME:-$HOME/.config}/zsh"

#############################################################
# NOTE: Other program settings:
#############################################################

# export AWT_TOOLKIT="MToolkit wmname LG3D"	#May have to install wmname
# export DICS="/usr/share/stardict/dic/"
# export FZF_DEFAULT_OPTS="--layout=reverse --height 40%"
# export LESS=-R
# export LESSOPEN="| /usr/bin/highlight -O ansi %s 2>/dev/null"
# export LESS_TERMCAP_mb="$(printf '%b' '[1;31m')"
# export LESS_TERMCAP_md="$(printf '%b' '[1;36m')"
# export LESS_TERMCAP_me="$(printf '%b' '[0m')"
# export LESS_TERMCAP_se="$(printf '%b' '[0m')"
# export LESS_TERMCAP_so="$(printf '%b' '[01;44;33m')"
# export LESS_TERMCAP_ue="$(printf '%b' '[0m')"
# export LESS_TERMCAP_us="$(printf '%b' '[1;32m')"
# export MOZ_USE_XINPUT2="1"		# Mozilla smooth scrolling/touchpads.
# export QT_QPA_PLATFORMTHEME="gtk2"	# Have QT use gtk2 theme.
# export SUDO_ASKPASS="$HOME/.local/bin/dmenupass"
# export _JAVA_AWT_WM_NONREPARENTING=1	# Fix for Java applications in dwm

# This is the list for lf icons:
export LF_ICONS="di=📁:\
fi=📃:\
tw=🤝:\
ow=📂:\
ln=⛓:\
or=❌:\
ex=🎯:\
*.txt=✍:\
*.mom=✍:\
*.me=✍:\
*.ms=✍:\
*.png=🖼:\
*.webp=🖼:\
*.ico=🖼:\
*.jpg=📸:\
*.jpe=📸:\
*.jpeg=📸:\
*.gif=🖼:\
*.svg=🗺:\
*.tif=🖼:\
*.tiff=🖼:\
*.xcf=🖌:\
*.html=🌎:\
*.xml=📰:\
*.gpg=🔒:\
*.css=🎨:\
*.pdf=📚:\
*.djvu=📚:\
*.epub=📚:\
*.csv=📓:\
*.xlsx=📓:\
*.tex=📜:\
*.md=📘:\
*.r=📊:\
*.R=📊:\
*.rmd=📊:\
*.Rmd=📊:\
*.m=📊:\
*.mp3=🎵:\
*.opus=🎵:\
*.ogg=🎵:\
*.m4a=🎵:\
*.flac=🎼:\
*.wav=🎼:\
*.mkv=🎥:\
*.mp4=🎥:\
*.webm=🎥:\
*.mpeg=🎥:\
*.avi=🎥:\
*.mov=🎥:\
*.mpg=🎥:\
*.wmv=🎥:\
*.m4b=🎥:\
*.flv=🎥:\
*.zip=📦:\
*.rar=📦:\
*.7z=📦:\
*.tar.gz=📦:\
*.z64=🎮:\
*.v64=🎮:\
*.n64=🎮:\
*.gba=🎮:\
*.nes=🎮:\
*.gdi=🎮:\
*.1=ℹ:\
*.nfo=ℹ:\
*.info=ℹ:\
*.log=📙:\
*.iso=📀:\
*.img=📀:\
*.bib=🎓:\
*.ged=👪:\
*.part=💔:\
*.torrent=🔽:\
*.jar=♨:\
*.java=♨:\
"

# [ ! -f ${XDG_CONFIG_HOME:-$HOME/.config}/shell/shortcutrc ] && shortcuts >/dev/null 2>&1 &

# if pacman -Qs libxft-bgra >/dev/null 2>&1; then
# 	# Start graphical server on user's current tty if not already running.
# 	[ "$(tty)" = "/dev/tty1" ] && ! pidof -s Xorg >/dev/null 2>&1 && exec startx "$XINITRC"
# else
# 	echo "\033[31mIMPORTANT\033[0m: Note that \033[32m\`libxft-bgra\`\033[0m must be installed for this build of dwm.
# Please run:
# 	\033[32myay -S libxft-bgra-git\033[0m
# and replace \`libxft\`. Afterwards, you may start the graphical server by running \`startx\`."
# fi

# # Switch escape and caps if tty and no passwd required:
# sudo -n loadkeys ${XDG_DATA_HOME:-$HOME/.local/share}/larbs/ttymaps.kmap 2>/dev/null


#################################################################
# NOTE: Less
#################################################################

# Set the default Less options.
# Mouse-wheel scrolling has been disabled by -X (disable screen clearing).
# Remove -X to enable it.
export LESS='-g -i -M -R -S -w -X -z-4'

# Set the Less input preprocessor.
# Try both `lesspipe` and `lesspipe.sh` as either might exist on a system.
if (( $#commands[(i)lesspipe(|.sh)] )); then
  export LESSOPEN="| /usr/bin/env $commands[(i)lesspipe(|.sh)] %s 2>&-"
fi

#################################################################
# NOTE: Misc
#################################################################

export SHELL_SESSIONS_DISABLE=1
