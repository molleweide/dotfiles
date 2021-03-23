# todo

# where to put REAPER map?
#   clone my reaper
#   cask install Reaper
#   - https://formulae.brew.sh/cask/reaper#default
#   - https://github.com/Homebrew/homebrew-cask/blob/master/Casks/reaper.rb
#   - https://github.com/Homebrew/homebrew-cask/blob/master/USAGE.md
#     read options about choosing install dir
#   - https://stackoverflow.com/questions/23484883/changing-homebrew-cask-installation-directories



#linkables=$( find -H "$INSTALLDIR" -maxdepth 3 -name '*.symlink' )
#for file in $linkables ; do
#  target="$HOME/.$( basename $file '.symlink' )"
#  if [ -e $target ]; then
install_dir=~/PRODUCTION/REAPER\ DAW
tmp_dir=~/temp_dir

read -r -p "Do you want to install Reaper DAW to $install_dir? [y|N] " response

if [[ $response =~ (y|yes|Y) ]]; then

  if [ ! -d $install_dir ]; then
    action "Installing Reaper DAW to $install_dir"
    mkdir -p $install_dir
    brew cask install reaper --appdir=$install_dir --force
    git clone --recurse-submodules https://github.com/molleweide/reaper-app-config.git $tmp_dir
    mv $tmp_dir/.git $install_dir/.git

    rm -r $tmp_dir # be careful


    pushd $install_dir > /dev/null 2>&1 # make $PWD = homedir

    echo "inside: $PWD ; now we reset to get all files back."
    git reset --hard HEAD

    popd > /dev/null 2>&1


    echo "we're back: $PWD"

    ok
  else
    ok ">>> Reaper is already installed it seems!!!"
  fi
fi





