#!/bin/bash

# save homebrew apps
./homebrew/backup.sh > ./homebrew/restore.sh

# save cask apps
brew cask list > cask/list.txt

# save karabiner settings
./karabiner/backup.sh > ./karabiner/restore.sh
