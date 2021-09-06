#!/usr/bin/env bash

# NOTE: lib > git
#
# learn how to make a nice git installer function
#
# flag args
#       https://stackoverflow.com/questions/7069682/how-to-get-arguments-with-flags-in-bash
#
# google shell style guide
#       https://google.github.io/styleguide/shellguide.html

function dot_git_clone_recursive() {
    local dest_dir=$1
    local repo_url=$2
    # local gith_user
    # local gith_repo_name

    if [ ! -d "$plugin_path" ]; then
        git clone https://github.com/pyenv/pyenv-virtualenv.git "$plugin_path"
    fi
    mkdir -p "$lspdir"
    git clone https://github.com/sumneko/lua-language-server "$location"
}

##########################################################
##########################################################

function install_personal_master_repos() {
    local name=$1
    local code_dir=$HOME/code
    local source_dir=$code_dir/$name

    mkdir -p "$code_dir"

    if [ ! -d $source_dir ]; then
        dotsay "+ cloning $source_dir"
        git clone https://github.com/molleweide/$name.git "$source_dir"
        pushd $source_dir
        git submodule update --init --recursive
        popd
    else
        dotsay "+ $source_dir already exists"
    fi

}

