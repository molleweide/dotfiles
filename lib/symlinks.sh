#!/usr/bin/env bash

# NOTE: LIB/SYMLINKG
#
# - make sure I cannot overwrite anything important
#

function dotfiles_location() {
    echo "$HOME/.dotfiles"
}

function dot_symlink() {
    local file=$1
    local link_destination=$2
    local force=$3
    local dotfiles_full_path="$(dotfiles_location)/$file"

    # echo "file:                 $file"
    # echo "dotfiles_full_path:   $dotfiles_full_path"
    echo "link_destination:     $link_destination"
    # # [ $file == "~" ] && exit 1 # lol this doesn't really work..

    if [ ! -e "$link_destination" ]; then
        echo "Symlinking $dotfiles_full_path -> $link_destination"
        mkdir -p "$(dirname "$link_destination")"
        ln -s "$dotfiles_full_path" "$link_destination"
    else
        if [[ "$force" == "F" ]]; then
            if [[ -L $link_destination ]]; then
                echo "LINK exists and is a SYMBOLIC"
                # echo "Symlinking (force) $dotfiles_full_path -> $link_destination"
                # rm -rf $link_destination # NOTE: be carefull!!!
                # ln -sF "$dotfiles_full_path" "$link_destination"
            else
                echo "LINK exists and is a regular file/dir. Needs to be dealt with manually..."
            fi
        fi
    fi
}
