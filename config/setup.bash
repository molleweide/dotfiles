#!/usr/bin/env bash
# shellcheck disable=SC2034
# do not use `export` keyword in this file

APK_INSTALL=(
	# gocryptfs: use `setup-util-gocryptfs` instead, as this version lags behind
	aria2
	git
	gnupg
	tree
	wget
)

# APT_REMOVE=(
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

APT_ADD=(
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
SNAP_INSTALL=(
	# 'code --classic'
	# deno
)

if "$DOROTHY/commands/is-mac"; then
	GO_INSTALL=(
		changkun.de/x/rmtrash
		github.com/gennaro-tedesco/boilit
		# github.com/cloudflare/utahfs/cmd/utahfs-client
	)
else
	GO_INSTALL=(
		changkun.de/x/rmtrash
		github.com/gennaro-tedesco/boilit
		# github.com/rfjakob/gocryptfs: use `setup-util-gocryptfs` instead, as this version lags behind
	)
fi

# HOMEBREW_ARCH="x86_64"
HOMEBREW_INSTALL=(
	# azure-cli
	# balena-cli
	# basictex
	# blackbox
	# hashicorp/tap/boundary
	# hashicorp/tap/consul
	# hashicorp/tap/nomad
	# hashicorp/tap/terraform
	# hashicorp/tap/vault
	# heroku
	# https://github.com/tmux-plugins/tmux-urlview
	# kryptco/tap/kr
	# librsvg
	# yarn
	"luajit --HEAD"
	"neovim --HEAD"
	"tree-sitter --HEAD"
	ack
	aria2
	appflowy            # notion alternative open source
	blueutil
	cabal-install       # haskell pkg manager
	calcurse
	code-minimap
	cointop
	coreutils
	coreutils
	curl
	deno
	diff-so-fancy
	direnv
	fasd
	fd
	fff # filebrowser
	ffmpeg
	figlet    # http://www.figlet.org/examples.html
	findutils # eg. unix `locate` command
	homebrew/cask-fonts/font-inconsolata-go-nerd-font
	homebrew/cask-fonts/font-jetbrains-mono-nerd-font
	fzf
	gh
	ghc
	ghq # remote repo management
	git
	git-extras
	git-lfs
	gnu-tar
	gnuplot
	gpg
	gpg-tui
	heroku/brew/heroku
	ImageMagick
	irssi
	isync
	koekeishiya/formulae/skhd
	koekeishiya/formulae/yabai
	lazygit
	lf # filebrowser
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
	ninja
	nnn                 # filebrowser
	# notion          # notes
	obsidian        # note
	openssh
	pandoc
	pass
	pass
	pass-otp
	paul-nameless/homebrew-repo/tg # telegram tui
	pinentry-mac
	pkg-config
	podman
	postgres
	ranger # filebrowser
	readline
	reattach-to-user-namespace # https://github.com/ChrisJohnsen/tmux-MacOSX-pasteboard
	redis
	ripgrep
	sc-im # spreadsheets
	screen
	# simplenote          # notes
	sl
	sox
	spotify-tui
	terminal-notifier
	tg # telegram tui
	the_silver_searcher
	tmux
	tmuxinator
	tree
	universal-ctags
	urlview # https://github.com/sigpipe/urlview
	vim
	watch
	watchman
	wget
	wget
	wp-cli
	xz # general-purpose data compression with high compression ratio
)
HOMEBREW_INSTALL_SLOW=(
	gpg
	shellcheck
)
HOMEBREW_INSTALL_CASK=(
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
	dmenu-mac
	# fantastical
	# firefox
	# freedom
	alacritty # terminal
	kitty     # terminal
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
	qtpass
	qutebrowser
	# screenflow
	signal
	# chromedriver
	# sketch
	# skype
	# soundsource
	spotify
	supercollider # audio engine
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
RUBY_VERSION="2.7"
RUBY_INSTALL=(
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
PYTHON_INSTALL=(
	# bitcoinlib
	# cairosvg
	# PyPDF2  # python 2 only
	pyobjc-framework-Quartz                     # mouse dependency for macos
	git+https://github.com/boppreh/mouse.git    # generate mouse events with python
	neovim
)
if "$DOROTHY/commands/is-ubuntu"; then
	PYTHON_INSTALL+=('youtube_dl')
fi

# npm/yarn
NODE_INSTALL=(
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
	gulp-cli
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
RUST_INSTALL=(
	# cargo install --git https://github.com/boxdot/gurk-rs
	proximity-sort
	ttyper
)

# utilities
# setup-util-*
SETUP_UTILS=(
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

# MAC_APPS_INSTALL=(
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

# LUA_ROCKS_INSTALL=(
# loop
# dkjson
# inspect
# --server=http://luarocks.org/dev lua-lsp
# luacheck
# lcf
# )

STACK_INSTALL=(
	"yesod-bin --install-ghc"
)
