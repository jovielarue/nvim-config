sudo apt update -y && sudo apt upgrade -y
sudo apt install git

wget https://github.com/neovim/neovim/releases/download/v0.10.1/nvim.appimage
sudo mv nvim.appimage /usr/bin/nvim
