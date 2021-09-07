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

    if [ ! -e "$link_destination" ]; then
        dotsay "@b@green[[ Symlinking: $dotfiles_full_path -> $link_destination ]]"
        mkdir -p "$(dirname "$link_destination")"
        ln -s "$dotfiles_full_path" "$link_destination"
    else
        if [[ "$force" == "F" ]]; then
            if [[ -L $link_destination ]]; then
                dotsay "@b@blue[[ Force re-linking: $dotfiles_full_path -> $link_destination ]]"
                echo ""
                rm -rf $link_destination # be carefull;
                ln -s "$dotfiles_full_path" "$link_destination"
            else
                dotsay "@b@red[[ Cannot link: \`$file\` is a regular file/dir and needs to be removed manually first... ]]"
            fi
        fi
    fi
}
