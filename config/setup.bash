#!/usr/bin/env bash

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
		github.com/gennaro-tedesco/boilit
		# github.com/cloudflare/utahfs/cmd/utahfs-client
	)
else
	export GO_INSTALL=(
		changkun.de/x/rmtrash
		github.com/gennaro-tedesco/boilit
		# github.com/rfjakob/gocryptfs: use `setup-util-gocryptfs` instead, as this version lags behind
	)
fi

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
	# https://github.com/tmux-plugins/tmux-urlview
	# librsvg
	# basictex
	"luajit --HEAD"
	"neovim --HEAD"
	"tree-sitter --HEAD"
	ImageMagick
	ack
	aria2
	blueutil
	calcurse
	code-minimap
	cointop
	coreutils
	coreutils
	curl
	deno
	diff-so-fancy
	direnv
	dmenu-mac
	fasd
	fd
	fff                 # filebrowser
	ffmpeg
	figlet              # http://www.figlet.org/examples.html
	font-inconsolata-go-nerd-font
	font-jetbrains-mono-nerd-font
	fzf
	gh
	ghc
	ghq                             # remote repo management
	git
	git-extras
	git-lfs
	gnu-tar
	gnuplot
	gpg
	gpg-tui
	heroku/brew/heroku
	hs                  # Hammerspoon CLI
	hub
	irssi
	isync
	koekeishiya/formulae/skhd
	koekeishiya/formulae/yabai
	lazygit
	lf                  # filebrowser
	libxml2
	libzip
	llvm
	lua
	luarocks
	mas
	micro
	most
	mps-youtube
	msmtp
	ncurses
	neofetch
	neomutt
	nnn                 # filebrowser
	openssh
	pandoc
	pass
	pass
	pass-otp
	passmenu
	paul-nameless/homebrew-repo/tg      # telegram tui
	pinentry-mac
	pkg-config
	podman
	postgres
	qtpass
	ranger              # filebrowser
	readline
	reattach-to-user-namespace  # https://github.com/ChrisJohnsen/tmux-MacOSX-pasteboard
	redis
	ripgrep
	sc-im               # spreadsheets
	screen
	sl
	sox
	spotify-tui
	terminal-notifier
	tg                  # telegram tui
	the_silver_searcher
	tmux
	tmuxinator
	tree
	universal-ctags
	urlview                     # https://github.com/sigpipe/urlview
	vim
	watch
	watchman
	wget
	wget
	wp-cli
	xz                          # general-purpose data compression with high compression ratio
    findutils           # eg. unix `locate` command
    ninja
    ubersicht
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
    alacritty           # terminal
    kitty               # terminal
	# geekbench
	# github-desktop
	# gitter
	# google-chrome
	# google-hangouts
	hammerspoon
	# jaikoz
	# java
	# julia
	# keybase
	# kodi
	licecap
	# little-snitch
	# loopback
	# micro-snitch
	mpv
	mullvadvpn
	# numi
	# opera
	# paragon-ntfs
	# plex-media-server
	# pomello
	# reflector
	qutebrowser
	# screenflow
	signal
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
	ubersicht
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
	awesome_print
	bundler
	cani
	compass
	ffi
	git-up
	hirb
	neovim
	pry
	sass
	tmuxinator
	twurl
	yard
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
	neovim
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

	bash-language-server
	tern
	neovim
	vim-node-rpc

	# cryptocurrency
	# cartera
	# coinmon
)

# rust/cargo/crates.io
# --locked: Require Cargo.lock is up to date
# as rust packages can be supported by many package managers, and as cargo requires downloading every dependency, most rust packages are better installed via SETUP_UTILS
export RUST_INSTALL=(
	# cargo install --git https://github.com/boxdot/gurk-rs
	proximity-sort
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
	# direnv        # FIX: (**) somekind of error when running this one.
	dust
	exa
	# fasd          # same also err (**)
	fd
	fish
	# fzf           # (**)
	gh
	# gnuplot
	gocryptfs
	grex
	httpie
	hyperfine
	jq
	# libxml2       # (**)
	# libzip        # (**)
	# lua           # (**) eg, setup-util-lua
	# luarocks      # (**)
	# ncurses       # (**)
	# neofetch      # (**)
	procs
	ripgrep
	rmesg
	sd
	tealdeer
	tokei
	zoxide
	# zsh-completions
)

# heroku plugins:install heroku-repo

# export MAC_APPS_INSTALL=(
# 937984704      # "Amphetamine"
# 425264550      # "Blackmagic Disk Speed Test"
# 948176063      # "Boom 2"
# 696977615      # "Capo 3"
# 975937182      # "Fantastical 2"
# 682658836      # "GarageBand"
# 634148309      # "Logic Pro X"
# 1084713122     # "Markoff"
# 967805235      # "Paste 2"
# 407963104      # "Pixelmator"
# 803453959      # "Slack"
# 402592703      # "Timeout"
# 425424353      # "The Unarchiver"
# )

# export LUA_ROCKS_INSTALL=(
# loop
# dkjson
# inspect
# --server=http://luarocks.org/dev lua-lsp
# luacheck
# lcf
# )

export STACK_INSTALL=(
	"yesod-bin --install-ghc"
)

