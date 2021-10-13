#!/usr/bin/env bash

# note on youtube-dl
# brew maintains it actively, and also will assist with dependencies
# however, ubuntu is slow to maintain, so install via pip instead
# http://ytdl-org.github.io/youtube-dl/download.html

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
gpg
pass
passmenu
pandoc
# librsvg
# basictex
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
# export MAC_APPS_INSTALL=(
#     mas_install "Amphetamine" 937984704
#     mas_install "Blackmagic Disk Speed Test" 425264550
#     mas_install "Boom 2" 948176063
#     mas_install "Capo 3" 696977615
#     mas_install "Fantastical 2" 975937182
#     mas_install "GarageBand" 682658836
#     mas_install "Logic Pro X" 634148309
#     mas_install "Markoff" 1084713122
#     mas_install "Paste 2" 967805235
#     mas_install "Pixelmator" 407963104
#     mas_install "Slack" 803453959
#     mas_install "Timeout" 402592703
#     mas_install "The Unarchiver" 425424353
# )

# heroku plugins:install heroku-repo
# # cargo install --git https://github.com/boxdot/gurk-rs
# # brew install irssi
# # brew tap paul-nameless/homebrew-repo

# brew tap homebrew/cask-fonts # if ! brew_is_tapped "neovim/neovim"; then
# brew install font-inconsolata-go-nerd-font
# brew install font-jetbrains-mono-nerd-font

# brew install --cask mpv

# brew install exa
# brew install neofetch
# brew install zsh
# brew install zsh-completions
# brew install direnv
# # brew_install z # would work better with neovim telescope!
# brew install fasd
# brew install fzf
# # if [ ! -f $HOME/.fzf.zsh ]; then
# #     $(brew --prefix)/opt/fzf/install --no-update-rc --key-bindings --completion
# # fi

# # # install antigen plugin manager
# # antigen_file="${XDG_CONFIG_HOME:-$HOME/.config}/zsh/vendor/antigen.zsh"
# # if [ ! -f $antigen_file ]; then
# #     echo "Installing antigen"
# #     curl -L git.io/antigen > "$antigen_file"
# # fi
