bot ">>> MY PROJECTS"

my_github_link=https://github.com/molleweide
install_dir=~/DEVELOPMENT
array=( one two three ) # declare an array called array and define 3 vales

read -r -p "Do you want to install personal git projects to $install_dir? [y|N] " response

if [[ $response =~ (y|yes|Y) ]]; then

    if [ ! -d $install_dir ]; then
        action "Installing Reaper DAW to $install_dir"
        mkdir -p $install_dir
        echo "Creating $install_dir."
        ok
    else
        ok ">>> $install_dir exists.!"
    fi

    pushd $install_dir > /dev/null 2>&1 # make $PWD = install_dir
    echo "Inside: $PWD."

    for i in "${array[@]}"
    do
        echo $i # Here, install my personal projects
    done
    popd > /dev/null 2>&1
    echo "we're back: $PWD"
fi





