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
/usr/local/bin/brew cleanup


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

# Fails with => gpg: keyserver receive failed: No route to host
# /usr/local/bin/gpg --keyserver hkp://pool.sks-keyservers.net --recv-keys 409B6B1796C275462A1703113804BB82D39DC0E3 7D2BAF1CF37B13E2069D6956105BD0E739499BDB

# Install rvm and source changes
# \curl -sSL https://get.rvm.io | bash -s stable --ruby --auto-dotfiles
# source ~/.rvm/scripts/rvm

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
/usr/local/bin/apm install --packages-file ./Atomfile

## Miscellaneous
# Home directory organization for projects
mkdir -p -v ~/workspace/personal ~/workspace/third_party
# Append customizations/aliases to .bash_profile
cat ./.bash_profile >> ~/.bash_profile
# Add-in Powerlevel9k zsh theme to zshrc
echo "source /usr/local/opt/powerlevel9k/powerlevel9k.zsh-theme" >> ~/.zshrc

# Install Oh my Zsh
# sh -c "$(curl -fsSL https://raw.githubusercontent.com/robbyrussell/oh-my-zsh/master/tools/install.sh | sed 's:env zsh -l::g' | sed 's:chsh -s .*$::g')"
 # Add user-check and skip if == "travis"

# TODO: iTerm2 TCC Accessibility
# TODO: root shell to oh-my-zsh with same template config
# TODO: Scaled resolution to "More Space"
# TODO: Disable 'Show Mirroring Options in the menu bar when available'
# TODO: Enable Firewall
# TODO: Dock positioned on left
# TODO: USe scroll gesture with modifier keys to zoom: ^Control
