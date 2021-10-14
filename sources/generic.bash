#!/usr/bin/env bash

# note on youtube-dl
# brew maintains it actively, and also will assist with dependencies
# however, ubuntu is slow to maintain, so install via pip instead
# http://ytdl-org.github.io/youtube-dl/download.html

export BROWSER="brave"
export PAGER='less' # alt. `most`
export TERMINAL="Alacritty" # or kitty | linux >> "st"


if "$DOROTHY/commands/is-mac"; then
	export USER_SHELLS=(
	bash
	zsh
	fish
	sh
)
else
	export USER_SHELLS=(
	bash
	zsh
	fish
	sh
)
fi

export TERMINAL_EDITORS=(
    nvim
	vim # --noplugin -c "set nowrap"'
	micro
	nano
)

export APK_INSTALL=(
# gocryptfs: use `setup-util-gocryptfs` instead, as this version lags behind
aria2
git
gnupg
tree
wget
)

# export APT_REMOVE=(
# 	aisleriot
# 	gnome-mahjongg
# 	gnome-mines
# 	gnome-sudoku
# 	gnomine
# 	imagemagick
# 	"libreoffice*"
# 	rhythmbox
# 	shotwell
# 	thunderbird
# )

export APT_ADD=(
# software-properties-common
aria2
atomicparsley # a youtube-dl dependency
build-essential
curl
git
gnome-keyring
libnotify-bin
libssl-dev
make
openssl
traceroute
vim
)

# https://code.visualstudio.com/docs/setup/linux
# if [[ "$(get-arch)" == 'x'* ]]; then
export SNAP_INSTALL=(
# 'code --classic'
# deno
)

if "$DOROTHY/commands/is-mac"; then
	export GO_INSTALL=(
	changkun.de/x/rmtrash
	# github.com/cloudflare/utahfs/cmd/utahfs-client
)
else
	export GO_INSTALL=(
	changkun.de/x/rmtrash
	# github.com/rfjakob/gocryptfs: use `setup-util-gocryptfs` instead, as this version lags behind
)
fi

# TODO:
export HOMEBREW_TAPS=(
    koekeishiya/formulae
    paul-nameless/homebrew-repo
)
# export HOMEBREW_ARCH="x86_64"
export HOMEBREW_INSTALL=(
# azure-cli
# balena-cli
# blackbox
# hashicorp/tap/boundary
# hashicorp/tap/consul
# hashicorp/tap/nomad
# hashicorp/tap/terraform
# hashicorp/tap/vault
# heroku
# kryptco/tap/kr
# yarn
neomutt
curl
isync
msmtp
pass
spotify-tui
mps-youtube
aria2
coreutils
deno
font-inconsolata-go-nerd-font
font-jetbrains-mono-nerd-font
gpg
pass
passmenu
pandoc
# librsvg
# basictex
irssi
ffmpeg
sox
ranger              # filebrowser
nnn                 # filebrowser
lf                  # filebrowser
fff                 # filebrowser
cointop
dmenu-mac
figlet              # http://www.figlet.org/examples.html
pass-otp
gpg-tui
diff-so-fancy
lazygit
qtpass
pinentry-mac
sc-im               # spreadsheets
git
git-extras
git-lfs
ImageMagick
mas
tg                  # telegram tui
calcurse
micro
openssh
pkg-config
podman
screen
terminal-notifier
tmux
tree
vim
watch
watchman
wget
ack
blueutil
code-minimap
coreutils
fd
gh
gnu-tar
heroku/brew/heroku
hub
llvm
most
postgres
readline
redis
ripgrep
sl
the_silver_searcher
universal-ctags
wget
wp-cli
xz # general-purpose data compression with high compression ratio
)
export HOMEBREW_INSTALL_SLOW=(
gpg
shellcheck
)
export HOMEBREW_INSTALL_CASK=(
aerial # screensaver
# 1password-cli
# acorn
# adguard
# airparrot
# appzapper
# atom
# audio-hijack
# backblaze
# bartender
brave
# burn
# caption
# ccleaner
# contexts
# dat
# devdocs
# fantastical
# firefox
# freedom
# geekbench
# github-desktop
# gitter
# google-chrome
# google-hangouts
# jaikoz
# java
# julia
# keybase
# kodi
# little-snitch
# loopback
# micro-snitch
mpv
# numi
# opera
# paragon-ntfs
# plex-media-server
# pomello
# reflector
qutebrowser
# screenflow
# signal
# chromedriver
# sketch
# skype
# soundsource
spotify
supercollider       # audio engine
# teamviewer
# toggldesktop
# torbrowser
# tower
# transmission
# transmit
# tunnelbear
# tunnelblick
# ubersicht
# undercover
# usage
# visual-studio-code
# vlc
# vmware-fusion
# webtorrent
# windscribe
# workflowy
# xld
# calibre
)

# gems
export RUBY_VERSION="2.7"
export RUBY_INSTALL=(
compass
ffi
git-up
sass
twurl
awesome_print
bundler
cani
hirb
neovim
pry
tmuxinator
zeus
)

# pip
# @todo swap PyPDF2 fro one of the following
# > https://stackoverflow.com/a/63557138/130638
# - https://github.com/pymupdf/PyMuPDF
# - https://github.com/pikepdf/pikepdf
# - https://github.com/pdfminer/pdfminer.six
export PYTHON_INSTALL=(
# bitcoinlib
# cairosvg
# PyPDF2  # python 2 only
)
if "$DOROTHY/commands/is-ubuntu"; then
	PYTHON_INSTALL+=('youtube_dl')
fi

# npm/yarn
export NODE_INSTALL=(
# bevry
# "@bevry/testen"
# boundation

	# servers
	# browser-refresh
	# live-server
	# serve

	# database
	# fauna-shell

	# ecosystems
	# "@stencil/core"
	# @cloudflare/wrangler
	# apollo
	# ember-cli
	# firebase-tools
	# ionic
	# lasso-cli
	# marko-cli
	# marko-starter
	# netlify-cli
	# now

	# tooling
	# tldr: replaced with tealdeer
	# typescript@next
	eslint
	json
	prettier
	typescript

	# cryptocurrency
	# cartera
	# coinmon
)

# rust/cargo/crates.io
# --locked: Require Cargo.lock is up to date
# as rust packages can be supported by many package managers, and as cargo requires downloading every dependency, most rust packages are better installed via SETUP_UTILS
export RUST_INSTALL=(
# cargo install --git https://github.com/boxdot/gurk-rs
ttyper
)

# utilities
# setup-util-*
export SETUP_UTILS=(
bandwich
bash
bat
bottom
delta
dust
exa
fd
fish
gh
gocryptfs
grex
httpie
hyperfine
neofetch
# zsh
zsh-completions
direnv
z # would work better with neovim telescope!
fasd
fzf
jq
procs
ripgrep
rmesg
sd
tealdeer
tokei
z
zoxide
)

# TODO:
export MAC_APPS_INSTALL=(
     937984704      # "Amphetamine"
     425264550      # "Blackmagic Disk Speed Test"
     948176063      # "Boom 2"
     696977615      # "Capo 3"
     975937182      # "Fantastical 2"
     682658836      # "GarageBand"
     634148309      # "Logic Pro X"
     1084713122     # "Markoff"
     967805235      # "Paste 2"
     407963104      # "Pixelmator"
     803453959      # "Slack"
     402592703      # "Timeout"
     425424353      # "The Unarchiver"
)

# heroku plugins:install heroku-repo
