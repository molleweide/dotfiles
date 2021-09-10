#!/usr/bin/env bash

# NOTE: LIB > OS-DETECTIONS
#
# - use `sw_vers -productVersion` to check OS version number`
# - reaper installer > how is semver done??
#   but you wouldn't ever need to use old macos versions anyway
#   so this is quite unnecessary. even though it is very nice
#   to have the ability to check versions numbers...

_current_os=$(uname)

_machine_hardware_name=$(uname -m)

function is_macos() {
  [[ "$_current_os" == "Darwin" ]]
}

function is_apple_silicone() {
  [[ "$_machine_hardware_name" == "arm64" ]]
}


function is_linux() {
  [[ "$_current_os" == "Linux" ]]
}
