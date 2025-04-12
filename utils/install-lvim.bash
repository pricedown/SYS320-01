#!/usr/bin/env bash

sudo apt-get update
sudo snap install nvim --classic
sudo apt-get install gcc

# backups
mv ~/.config/nvim{,.bak}
mv ~/.local/share/nvim{,.bak}
mv ~/.local/state/nvim{,.bak}
mv ~/.cache/nvim{,.bak}

# LazyVim
git clone https://github.com/LazyVim/starter ~/.config/nvim
rm -rf ~/.config/nvim/.git

# More configuration

nvim

cp -rf ./lvim-cfg/options.lua ~/.config/nvim/lua/config/options.lua
cp -rf ./lvim-cfg/colorscheme.lua ~/.config/nvim/lua/plugins/colorscheme.lua
