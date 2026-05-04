#!/bin/bash

CMD="ln -s" # Link configs rather then copy "cp -r" to copy
BASE_DIR=$(dirname $(realpath -s "$BASH_SOURCE"))
cd $BASE_DIR

installConfig() {

  if [[ ! -e "$1" ]]; then
    echo "$1"
    echo "config does not exist"
    echo "Check your are on dotfiles root and config exists"
    return
  fi

  if [[ ! -d "${2%/*}" ]]; then
    echo "Making directory ${2%/*}"
    $SUDO mkdir -p "${2%/*}"
  fi
  echo "$2"
  if [[ -e "$2" ]]; then # If config exists ask to over write config
    echo "Overwrite $2? [y/n]"
    read -r input
    if [[ $input == "y" ]]; then
      echo "Removing $2"
      $SUDO rm -rf "$2"
    else
      return
    fi
  fi

  echo "Installing $2"
  $SUDO $CMD "$(realpath $1)" "$2"
  echo
}

archConfig() {
  # Root Home DIR configs
  installConfig configs/bashrc $HOME/.bashrc
  installConfig configs/profile $HOME/.profile

  # Config Folder
  installConfig configs/btop $HOME/.config/btop
  installConfig configs/dunst $HOME/.config/dunst
  installConfig configs/hypr $HOME/.config/hypr
  installConfig configs/kitty $HOME/.config/kitty
  installConfig configs/matugen $HOME/.config/matugen
  installConfig configs/pipewire $HOME/.config/pipewire
  installConfig configs/quickshell $HOME/.config/quickshell
  installConfig configs/rofi $HOME/.config/rofi
  installConfig configs/Thunar $HOME/.config/Thunar

  # System / sudo required configs
  SUDO=sudo
  installConfig configs/sysctl.d/80-gamecompatibility.conf /etc/sysctl.d/80-gamecompatibility.conf
  installConfig configs/modprobe.d/nobeep.conf /etc/modprobe.d/nobeep.conf
}

archConfig
