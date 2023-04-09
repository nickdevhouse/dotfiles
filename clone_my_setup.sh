#!/bin/bash

dotfile_repo_url="https://github.com/nickdevhouse/dotfiles"

####################################################
#                  Preparation                     #
####################################################

## Check if homebrew is installed
echo "Checing Homebrew Installation"
if command -v brew > /dev/null; then
  echo "Homebrew is installed, upgrade it"
  brew upgrade
else
  echo "Homebrew is not installed, install it"
  /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
fi

## Check if iTerm2 is installed
if [ -f "/Applications/iTerm.app/Contents/MacOS/iTerm2" ]
then
  echo "iTerm2 is installed"
else
  echo "iTerm2 is not installed"
  brew install iterm2
fi

echo "Install realtated app: fish and tmux etc"
brew install git fish tmux neovim exa ghq peco


####################################################
#                  Clone My Setup                  #
####################################################

# Git setup repo clone
echo "Clone Setup into local dotfiles folder"
cd ~
git clone $dotfile_repo_url dotfiles 

echo $(pwd)

# Copy each setup
echo "Import iTerms Color Presets"
presets_path="./dotfiles/iTerm_presets.itermcolors"
open "$presets_path" -a iTerm2

echo "Copy fish setup"
cp -R ./dotfiles/.config/fish ./.config/fish

echo "Copy tmux setup"
cp -R ./dotfiles/.config/tmux ./.config/tmux

echo "Copy nivm setup"
cp -R ./dotfiles/.config/nvim ./.config/nvim


####################################################
#               Update Neovim Plugins              #
####################################################

# Run PackerSync
nvim -c "PackerSync"
