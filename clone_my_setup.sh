#!/bin/bash

dotfile_repo_url="https://github.com/nickdevhouse/dotfiles"

####################################################
#                  Preparation                     #
####################################################

## Check if homebrew is installed
echo ">>> Checing Homebrew Installation"
if command -v brew > /dev/null; then
  echo " - Homebrew is installed, upgrade it"
  brew upgrade
else
  echo " - Homebrew is not installed, install it"
  /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
fi

## Check if iTerm2 is installed
if [ -f "/Applications/iTerm.app/Contents/MacOS/iTerm2" ]
then
  echo " - iTerm2 is installed"
else
  echo " - iTerm2 is not installed"
  brew install iterm2
fi

echo ">>> Install realtated app: fish and tmux etc"
brew install git fish tmux neovim exa ghq peco


####################################################
#                  Clone My Setup                  #
####################################################

# Git setup repo clone
echo ">>> Clone Setup into local dotfiles folder"
cd ~
git clone $dotfile_repo_url dotfiles 

# Copy each setup
echo ">>> Import iTerms Color Presets"
presets_path="./dotfiles/iTerm_presets.itermcolors"
open "$presets_path" -a iTerm2

echo ">>> Copy my fish theme setup"
test -d ./.config/fish && rm -rf ./.config/fish
cp -aR ./dotfiles/.config/fish ./.config/fish

echo ">>> Install fisher and z"
curl -sL https://raw.githubusercontent.com/jorgebucaran/fisher/main/functions/fisher.fish | source && fisher install jorgebucaran/fisher
fish -c "fisher remove jethrokuan/z"
fish -c "fisher install jethrokuan/z"

echo ">>> Archiv exist tmux folder and copy my tmux setup"
test -d ./.config/tmux && rm -rf ./.config/tmux
cp -aR ./dotfiles/.config/tmux ./.config/tmux

echo ">>> Archiv exist nvim folder and copy my nvim setup"
test -d ./.config/nvim && rm -rf ./.config/nvim
cp -aR ./dotfiles/.config/nvim ./.config/nvim

####################################################
#               Update Neovim Plugins              #
####################################################

# Run PackerSync
nvim --headless -c "sleep 2" -c "silent PackerSync" -c "qa"
echo "PackerSync Done!"
