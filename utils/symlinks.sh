#!/usr/bin/env bash

# _symlinks_current_dir="${BASH_SOURCE%/*}"

# function dotfiles_location() {
#   echo $(cd $_symlinks_current_dir/../.. && pwd)
# }

function dotfiles_location() {
    echo "$HOME/.dotfiles"
}

# TODO: make sure you cannot symlink ~/
function dot_symlink() {
    local file=$1
    local link_destination=$2
    local force=$3
    local dotfiles_full_path="$(dotfiles_location)/$file"

    echo "dotfiles_full_path: $dotfiles_full_path"
    echo "link_destination:   $link_destination"

    if [ ! -e "$link_destination" ]; then
        echo "Symlinking $dotfiles_full_path -> $link_destination"
        mkdir -p "$(dirname "$link_destination")"
        ln -sv "$dotfiles_full_path" "$link_destination"
    else
        if [[ "$force" == "F" ]]; then
            echo "Symlinking (force) $dotfiles_full_path -> $link_destination"
            # rm -rf $link_destination
            ln -sv "$dotfiles_full_path" "$link_destination"
        fi
    fi
}
