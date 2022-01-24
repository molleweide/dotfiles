#!/usr/bin/env bash
# shellcheck disable=SC2034
# do not use `export` keyword in this file

source "$DOROTHY/config/setup.bash"

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
		github.com/gennaro-tedesco/boilit # manual install -> `go get -u -v github.com/gennaro-tedesco/boilit`
		github.com/uw-labs/strongbox
		# github.com/cloudflare/utahfs/cmd/utahfs-client
	)
else
	GO_INSTALL=(
		changkun.de/x/rmtrash
		github.com/gennaro-tedesco/boilit
		github.com/uw-labs/strongbox
		# github.com/rfjakob/gocryptfs: use `setup-util-gocryptfs` instead, as this version lags behind
	)
fi

# fzf
# gnuplot
# libxml2
# libzip
# lua
# luarocks
# ncurses
# neofetch
# zsh-completions
HOMEBREW_FORMULAS=(
	'ack'
	'blueutil'
	'cabal-install'
	'calcurse'
	'code-minimap'
	'cointop'
	'cmacrae/formulae/spacebar'
	'diff-so-fancy'
	'direnv'
	'fasd'
	'fff'
	'figlet'
	'findutils'
	'fswatch'
	'fzf'
	'gcc'
	'ghc'
	'ghq'
	'git-extras'
	'gnu-tar'
	'syncthing'
	'docker'
	'gnuplot'
	'gpg-tui'
	'heroku/brew/heroku'
	'hub'
	'imagemagick'
	'irssi'
	'isync'
	'koekeishiya/formulae/skhd'
	'koekeishiya/formulae/yabai'
	'lazygit'
	'lf'
	'libxml2'
	'libzip'
	'lua'
	'luarocks'
	'most'
	'mps-youtube'
	'msmtp'
	'ncurses'
	'neofetch'
	'neomutt'
	'ninja'
	'nnn'
	'pandoc'
	'pass'
	'pass-otp'
	'paul-nameless/repo/tg'
	'pinentry-mac'
	'podman'
	'postgresql'
	'ranger'
	'readline'
	'reattach-to-user-namespace'
	'redis'
	'sc-im'
	'sd'
	'sl'
	'sox'
	'spotify-tui'
	'subversion'
	'terminal-notifier'
	'the_silver_searcher'
	'tmux'
	'tmuxinator'
	'tree'
	'universal-ctags'
	'urlview'
	'watch'
	'watchman'
	'wp-cli'
	'xz'
)
HOMEBREW_SLOW_FORMULAS=(
	gpg
	shellcheck
)

# 1password-cli
# acorn
# adguard
# airparrot
# appzapper
# atom
# audio-hijack
# backblaze
# bartender
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
# numi
# opera
# paragon-ntfs
# plex-media-server
# pomello
# reflector
# screenflow
# chromedriver
# sketch
# skype
# soundsource
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
HOMEBREW_CASKS=(
    '1password'
	'aerial'
	'alacritty'
	'appflowy'
	'docker'
	'syncthing'
	'brave-browser'
	'dmenu-mac'
	'hammerspoon'
	'kitty'
	'licecap'
	'mpv'
	'mullvadvpn'
	'native-access'
	'notion'
	'obsidian'
	'qtpass'
	'qutebrowser'
	'spotify'
	'supercollider'
	'ubersicht'
)

# gems
GEM_INSTALL=(
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
PIPX_INSTALL=(
	# bitcoinlib
	# cairosvg
	# PyPDF2  # python 2 only
	pyobjc-framework-Quartz                  # mouse dependency for macos
	git+https://github.com/boppreh/mouse.git # generate mouse events with python
	neovim
)

NPM_INSTALL=(
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
CARGO_INSTALL=(
	# cargo install --git https://github.com/boxdot/gurk-rs
	proximity-sort
	ttyper
)

SETUP_UTILS=(
	'aria2'
	'bandwhich'
	'bash'
	'bat'
	'bottom'
	'curl'
	'delta'
	'deno'
	'devel'
	'dust'
	'exa'
	'fd'
	'fish'
	'gh'
	'git'
	'glab'
	'gocryptfs'
	'grex'
	'httpie'
	'hyperfine'
	'jq'
	'mas'
	'micro'
	'neovim'
	'procs'
	'ripgrep'
	'rmesg'
	'screen'
	'sd'
	'shellcheck'
	'signal'
	'tealdeer'
	'tokei'
	'vim'
	'vscode'
	'wget'
	'zoxide'
)

# heroku plugins:install heroku-repo

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
# MAS_INSTALL=(
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
HOMEBREW_ENCODING_INSTALL=no
HOMEBREW_FONTS=(
	'font-cantarell'
	'font-cascadia-code'
	'font-fira-code'
	'font-fira-code-nerd-font'
	'font-fira-mono'
	'font-fira-mono-nerd-font'
	'font-hack'
	'font-hasklig'
	'font-ibm-plex'
	'font-inconsolata-go-nerd-font'
	'font-inter'
	'font-jetbrains-mono'
	'font-jetbrains-mono-nerd-font'
	'font-lato'
	'font-maven-pro'
	'font-monoid'
)
GO_LINTING_INSTALL=no
