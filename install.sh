#!/bin/bash
# This script assumes you have bash installed as a shell

sudo apt update
sudo apt install cmake
sudo apt install lua5.1
sudo apt install luajit

handle_error() {
  ./nvim.appimage --appimage-extract
  ./squashfs-root/AppRun --version
  
  # Optional: exposing nvim globally.
  mv squashfs-root /
  ln -s /squashfs-root/AppRun /usr/bin/nvim
  nvim
  exit 1
}
trap 'handle_error' ERR

curl -LO https://github.com/neovim/neovim/releases/latest/download/nvim.appimage
chmod u+x nvim.appimage
./nvim.appimage
