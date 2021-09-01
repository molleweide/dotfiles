#!/usr/bin/env bash

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
