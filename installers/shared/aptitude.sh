#!/usr/bin/env bash

function apt_update() {
  ! is_linux && return 1

  sudo apt-get update
}

function apt_is_installed() {
  ! is_linux && return 1

  local package=$1

  dpkg -s "$package" >/dev/null 2>&1
}

function apt_install() {
  ! is_linux && return 1

  local package=$1

  # check for os here and make sure shit will
  # install.
  # - check pack manager
  #     https://unix.stackexchange.com/questions/46081/identifying-the-system-package-manager
  #     https://unix.stackexchange.com/questions/6345/how-can-i-get-distribution-name-and-version-number-in-a-simple-shell-script
  #     apt_install >> check if arch >> use pacman

  if [ -f /etc/os-release ]; then
    # freedesktop.org and systemd
    . /etc/os-release
    OS=$NAME
    VER=$VERSION_ID
  elif type lsb_release >/dev/null 2>&1; then
    # linuxbase.org
    OS=$(lsb_release -si)
    VER=$(lsb_release -sr)
  elif [ -f /etc/lsb-release ]; then
    # For some versions of Debian/Ubuntu without lsb_release command
    . /etc/lsb-release
    OS=$DISTRIB_ID
    VER=$DISTRIB_RELEASE
  elif [ -f /etc/debian_version ]; then
    # Older Debian/Ubuntu/etc.
    OS=Debian
    VER=$(cat /etc/debian_version)
  elif [ -f /etc/SuSe-release ]; then
    # Older SuSE/etc.
    ...
  elif [ -f /etc/redhat-release ]; then
    # Older Red Hat, CentOS, etc.
    ...
  else
    # Fall back to uname, e.g. "Linux <version>", also works for BSD, etc.
    OS=$(uname -s)
    VER=$(uname -r)
  fi


  echo "OS: $OS | VERSION: $VER"


  INSTALL_COMMAND="sudo apt-get install -y"

  # check if package exists

  # which package
  # check if string "no $pname in "

  if [ $OS = "EndeavourOS" ]; then
    echo "!!"
    INSTALL_COMMAND="sudo pacman -s"
  fi

  echo "cmd str: $INSTALL_COMMAND"


  # ubuntu / debian
  # dpkg -s sudo

  # red hat / fedora / suse / centos
  # rpm -qa | grep {package-name}


  if apt_is_installed "$package"; then
    dotsay "+ $package already installed... skipping."
  else
    $("$INSTALL_COMMAND $package")
  fi
}
