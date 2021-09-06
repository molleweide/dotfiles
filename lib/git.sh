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



# -e 's/((@(red|green|yellow|blue|magenta|cyan|white|reset|b|u))+)[[]{2}(.*)[]]{2}/\1\4@reset/g' \
#     -e "s/@red/$(tput setaf 1)/g" \
#     -e "s/@green/$(tput setaf 2)/g" \
#     -e "s/@yellow/$(tput setaf 3)/g" \
#     -e "s/@blue/$(tput setaf 4)/g" \
#     -e "s/@magenta/$(tput setaf 5)/g" \
#     -e "s/@cyan/$(tput setaf 6)/g" \
#     -e "s/@white/$(tput setaf 7)/g" \
#     -e "s/@reset/$(tput sgr0)/g" \
#     -e "s/@b/$(tput bold)/g" \
#     -e "s/@u/$(tput sgr 0 1)/g"


function dotlib_clone_projects_from_array() {
    # two step process in order to accept array as arg
    string=$1
    array=($@)
    # echo "PWD = $PWD"

    i=0
    for arr_val in "${array[@]}"; do
        mod2=$(( $i % 2 == 0 ))

        if [ $i == 0 ]; then
            install_dir=$arr_val
            dotsay "@b@cyan[[ INSTALL DIR: \`$install_dir\` ]]\n"
            mkdir -p $install_dir > /dev/null
            pushd $install_dir > /dev/null 2>&1
            # echo "PWD = $PWD"

        elif (( ! $mod2 )); then
            alt_name=$arr_val

        else
            repo_url=$arr_val
            dotsay "@b@blue[[ @green$alt_name <- @magenta$repo_url]]"
        fi

        i=$((i+1))
    done

    popd > /dev/null 2>&1
    # echo "PWD = $PWD"
}

function dotlib_git_clone_recursive() {
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
