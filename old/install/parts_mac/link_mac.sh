bot "Symlinking dotfiles"

read -r -p "Do you want to take backup and symlink dotfiles? [y|N] " response

if [[ $response =~ (y|yes|Y) ]]; then

  now=$(date +"%Y.%m.%d.%H.%M.%S")

  # 1. symlink homedir ------------------------------------------------

  bot "creating symlinks for homedir----"
  pushd symlink/homedir > /dev/null 2>&1 # make $PWD = homedir
  for file in .*; do
    if [[ $file == "." || $file == ".." ]]; then
      continue # make sure we ignore . and .. , and ONLY match dotfiles in homedir
    fi

    running "~/$file"
    # if the file exists:
    if [[ -e ~/$file ]]; then
        mkdir -p ~/.dotfiles_backup/$now
        mv ~/$file ~/.dotfiles_backup/$now/$file
        echo "backup saved as ~/.dotfiles_backup/$now/$file"
    fi

    ## symlink might still exist
    unlink ~/$file > /dev/null 2>&1

    # create the link
    # since we have used pushd, $pwd is now homedir, so we can write:
    ln -s $PWD/$file ~/$file
    echo -en '\tlinked';ok
  done
  popd > /dev/null 2>&1


  # 2. symlink config -------------------------------------------------

  bot "creating symlinks for config----"
  pushd symlink/config > /dev/null 2>&1
  for file in *; do
    if [[ $file == "." || $file == ".." ]]; then
      continue # make sure we ignore . and .. , and ONLY match dotfiles in homedir
    fi

    running "~/.config/$file"
    # if the file exists:
    if [[ -e ~/.config/$file ]]; then
        mkdir -p ~/.dotfiles_backup/$now/config
        mv ~/.config/$file ~/.dotfiles_backup/$now/config/$file
        echo "backup saved as ~/.dotfiles_backup/$now/config/$file"
    fi

    ## symlink might still exist
    unlink ~/.config/$file > /dev/null 2>&1

    # create the link
    # since we have used pushd, $pwd is now homedir, so we can write:
    ln -s $PWD/$file ~/.config/$file
    echo -en '\tlinked';ok
  done
  popd > /dev/null 2>&1

fi
