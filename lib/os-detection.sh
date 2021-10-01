#!/usr/bin/env bash

# NOTE: LIB > OS-DETECTIONS
#
# - use `sw_vers -productVersion` to check OS version number`
# - reaper installer > how is semver done??
#   but you wouldn't ever need to use old macos versions anyway
#   so this is quite unnecessary. even though it is very nice
#   to have the ability to check versions numbers...

_current_os=$(uname)

arch=$(uname -m)

function is_macos() {
    [[ "$_current_os" == "Darwin" ]]
}

function is_apple_silicone() {
    [[ "$(uname -a)" = *ARM64* ]]
}


function is_linux() {
    [[ "$_current_os" == "Linux" ]]
}

# https://en.wikipedia.org/wiki/X86-64
# https://en.wikipedia.org/wiki/AArch64
# https://askubuntu.com/a/1320647/22776
# https://stackoverflow.com/q/67996157/130638

function get_arch() {
    if test "$arch" = 'aarch64' -o "$arch" = 'arm64'; then
	    echo 'a64'  # raspberry pi, apple m1
    elif [[ "$arch" = x86_64* ]]; then
	    if [[ "$(uname -a)" = *ARM64* ]]; then
		    echo 'a64'  # apple m1 running via `arch -x86_64 /bin/bash -c "uname -m"`
	    else
		    echo 'x64'
	    fi
    elif [[ "$arch" = i*86 ]]; then
	    echo 'x32'
    elif [[ "$arch" = arm* ]]; then
	    echo 'a32'
    else
	    exit 1
    fi
}
