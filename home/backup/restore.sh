#!/bin/bash

# install homebrew
source ./homebrew/install.sh

# restore brew apps
source ./homebrew/restore.sh

# install oh-my-zsh
source ./oh-my-zsh/install.sh

# restore cask apps
cat cask/list.txt | xargs brew cask install

# restore karabiner settigns
source ./karabiner/restore.sh

# download gruvbox theme for iterm2
wget https://raw.githubusercontent.com/morhetz/gruvbox-contrib/master/iterm2/gruvbox-dark.itermcolors -O ~/Downloads/gruvbox.itermcolors

# install stable nodejs
n stable
