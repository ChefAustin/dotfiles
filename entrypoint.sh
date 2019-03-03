#!/usr/bin/env bash
set -e

##### Satisfy initial dependencies
# Install Homebrew (we `echo |` to skirt prompt)
echo | ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
# Update Homebrew and formulae
/usr/local/bin/brew update
# Invoke Brewfile bootstrap
/usr/local/bin/brew bundle
# Clean up after oneself
brew cleanup


##### macOS preferences
## Input devices
# Decrease key-repeat times
defaults write -g InitialKeyRepeat -int 15
defaults write -g KeyRepeat -int 2
# Set "unnatural" scroll direction
defaults write NSGlobalDomain com.apple.swipescrolldirection -bool false

## Finder
# Show hidden files in Finder
defaults write com.apple.Finder AppleShowAllFiles -bool true

## Hot Corner
# Trigger screensaver
defaults write com.apple.dock wvous-br-modifier -int 0
defaults write com.apple.dock wvous-br-corner -int 5
# Trigger Mission Control
defaults write com.apple.dock wvous-tl-modifier -int 0
defaults write com.apple.dock wvous-tl-corner -int 2

## Dock
# Remove all icons from dock
defaults write com.apple.dock autohide -bool true
/usr/local/bin/dockutil --remove all

##### Ruby Environment
# Gather rvm GPG keys
gpg2 --recv-keys 409B6B1796C275462A1703113804BB82D39DC0E3 7D2BAF1CF37B13E2069D6956105BD0E739499BDB
# Install rvm and source changes
\curl -sSL https://get.rvm.io | bash -s stable --ruby --auto-dotfiles
source ~/.rvm/scripts/rvm

##### App preferences
## iTerm2
# Define path to custom iTerm2 preference directory
defaults write com.googlecode.iterm2.plist PrefsCustomFolder -string "~/dotfiles/iterm2"
# Enable pre-defined custom iTerm2 preference directory
defaults write com.googlecode.iterm2.plist LoadPrefsFromCustomFolder -bool true

## Spectacle
defaults write com.divisiblebyzero.Spectacle.plist BackgroundAlertSuppressed -bool true
defaults write com.divisiblebyzero.Spectacle.plist SUEnableAutomaticChecks -bool true
defaults write com.divisiblebyzero.Spectacle.plist StatusItemEnabled -bool false

#### Install Atom packages
/usr/local/bin/apm --packages-file ./Atomfile

## Miscellaneous
# Home directory organization for projects
mkdir -p -v ~/workspace/personal ~/workspace/third_party
# Append customizations/aliases to .bash_profile
cat ./.bash_profile >> ~/.bash_profile
# Install Oh my Zsh
sh -c "$(curl -fsSL https://raw.github.com/robbyrussell/oh-my-zsh/master/tools/install.sh)"




# CONTEXT SWITCH (Put this last as a safeguard)
# Enroll in Apple Developer beta seed program
sudo /System/Library/PrivateFrameworks/Seeding.framework/Versions/A/Resources/seedutil enroll DeveloperSeed
