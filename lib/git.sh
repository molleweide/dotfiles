#!/usr/bin/env bash

# NOTE: lib > git
#
# google shell style guide
#       https://google.github.io/styleguide/shellguide.html

function dotlib_git_clone_recursive() {
    local install_dir=$1
    local alt_name=$2
    local repo_url=$3
    dotsay "@b@blue[[ @yellow$alt_name <- @magenta$repo_url]]"

    mkdir -p $install_dir

    if [ ! -d "$install_dir/$alt_name" ]; then
        dotsay "@b@green[[ Doesn't exist. Installing... \n]]"

        # git clone URL PATH
        pushd $install_dir/$alt_name > /dev/null 2>&1
        # echo "PWD = $PWD"
        git clone $repo_url $alt_name
        git submodule update --init --recursive

        popd > /dev/null 2>&1
        # echo "PWD = $PWD"

    # else
    #     echo "no"
    else
        dotsay "@b@red[[ Already exists. \n]]"
    fi
}

function dotlib_clone_projects_from_array() {
    # two step process in order to accept array as arg
    # TODO: validate is array
    string=$1
    array=($@)
    # echo "PWD = $PWD"

    i=0
    for arr_val in "${array[@]}"; do
        mod2=$(( $i % 2 == 0 ))

        if [ $i == 0 ]; then
            # TODO: validate is file/dir
            install_dir=$arr_val
            dotsay "@b@cyan[[ INSTALL DIR: \`$install_dir\` ]]\n"
            mkdir -p $install_dir > /dev/null
            pushd $install_dir > /dev/null 2>&1
            # echo "PWD = $PWD"

        elif (( ! $mod2 )); then
            # TODO: validate is string name and NOT git url
            alt_name=$arr_val

        else
            # TODO: validate is github url
            repo_url=$arr_val
            # dotsay "@b@blue[[ @green$alt_name <- @magenta$repo_url]]"
            dotlib_git_clone_recursive \
                $install_dir \
                $alt_name \
                $repo_url
        fi

        i=$((i+1))
    done

    popd > /dev/null 2>&1
    # echo "PWD = $PWD"
}
