#!/usr/bin/env bash
set -e

##### Satisfy dependencies
# Install Homebrew (we `echo |` to skirt prompt)
echo | ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"

# Update Homebrew and formulae
/usr/local/bin/brew update

# Invoke Brewfile bootstrap
/usr/local/bin/brew bundle



##### Ruby Environment
# Gather rvm GPG keys
gpg2 --recv-keys 409B6B1796C275462A1703113804BB82D39DC0E3 7D2BAF1CF37B13E2069D6956105BD0E739499BDB

# Install rvm and source changes
\curl -sSL https://get.rvm.io | bash -s stable --ruby --auto-dotfiles
source ~/.rvm/scripts/rvm



##### macOS preferences
# Decrease key-repeat times
/usr/bin/defaults write -g InitialKeyRepeat -int 15
/usr/bin/defaults write -g KeyRepeat -int 2

# Set "unnatural" scroll direction
/usr/bin/defaults write NSGlobalDomain com.apple.swipescrolldirection -bool false

# Remove all icons from dock
/usr/local/bin/dockutil --remove all

mkdir -p -v ~/workspace/personal ~/workspace/third_party
