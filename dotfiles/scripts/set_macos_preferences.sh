#!/bin/zsh

echo "Setting macOS preferences…"

# change keyboard to dvorak at system login level
# https://vkritis.blogspot.com/2014/01/change-default-keyboard-of-osx-login.html

# Close any open System Preferences panes, to prevent them from overriding
# settings we’re about to change
osascript -e 'tell application "System Preferences" to quit'

# list of plist commands
# https://macos-defaults.com

# Set the default view style for folders without custom setting: Column
defaults write com.apple.finder "FXPreferredViewStyle" -string "clmv"

# Set the default search scope when performing a search: Search the current folder
defaults write com.apple.finder "FXDefaultSearchScope" -string "SCcf"

# Remove items in the bin after 30 days: automatic
defaults write com.apple.finder "FXRemoveOldTrashItems" -bool "true"

# Keep folders on top when sorting
defaults write com.apple.finder "_FXSortFoldersFirstOnDesktop" -bool "true"

# Show path bar and status bar
defaults write com.apple.finder ShowStatusBar -bool true
defaults write com.apple.finder ShowPathbar -bool true

# Items to display on the desktop
defaults write com.apple.finder ShowHardDrivesOnDesktop -int 0
defaults write com.apple.finder ShowExternalHardDrivesOnDesktop -int 1
defaults write com.apple.finder ShowRemovableMediaOnDesktop -int 1
defaults write com.apple.finder ShowMountedServersOnDesktop -int 0

# Open home in new window
defaults write com.apple.finder NewWindowTarget -string "PfLo"
defaults write com.apple.finder NewWindowTargetPath -string "'file://$HOME/"

# Enable dragging with three finger drag
defaults write com.apple.AppleMultitouchTrackpad "TrackpadThreeFingerDrag" -bool "true"

# Do not display recent apps in the Dock
defaults write com.apple.dock "show-recents" -bool "true"

# Autohide the Dock when the mouse is out
defaults write com.apple.dock "autohide" -bool "true"

# Dock: Make it popup faster
defaults write com.apple.dock autohide-delay -float 0
defaults write com.apple.dock autohide-time-modifier -float 0

###############################################################################
# Time Machine                                                                #
###############################################################################

# Prevent Time Machine from prompting to use new hard drives as backup volume
defaults write com.apple.TimeMachine DoNotOfferNewDisksForBackup -bool true

###############################################################################
# Text Editing / Keyboards                                                    #
###############################################################################

# Disable smart quotes and smart dashes
defaults write NSGlobalDomain NSAutomaticQuoteSubstitutionEnabled -bool false
defaults write NSGlobalDomain NSAutomaticDashSubstitutionEnabled -bool false

# Disable auto-correct
defaults write NSGlobalDomain NSAutomaticSpellingCorrectionEnabled -bool false

# Use plain text mode for new TextEdit documents
defaults write com.apple.TextEdit RichText -int 0

# Open and save files as UTF-8 in TextEdit
defaults write com.apple.TextEdit PlainTextEncoding -int 4
defaults write com.apple.TextEdit PlainTextEncodingForWrite -int 4

###############################################################################
# Trackpad, mouse, keyboard, Bluetooth accessories, and input                 #
###############################################################################

# Enable full keyboard access for all controls
# (e.g. enable Tab in modal dialogs)
defaults write NSGlobalDomain AppleKeyboardUIMode -int 3

# Set key repeat rate to fast
defaults write NSGlobalDomain KeyRepeat -int 2

# Reduce delay to repeat
defaults write NSGlobalDomain InitialKeyRepeat -int 15

# Increase trackpad speed
defaults write NSGlobalDomain com.apple.trackpad.scaling -int 2.5

###############################################################################
# Hot corners                                                                 #
###############################################################################
# Hot corners
# Possible values: 0 no-op; 2 Mission Control; 3 Show application windows;
# 4 Desktop; 5 Start screen saver; 6 Disable screen saver; 7 Dashboard;
# 10 Put display to sleep; 11 Launchpad; 12 Notification Center

# defaults write com.apple.dock wvous-tl-corner -int 3
# defaults write com.apple.dock wvous-tl-modifier -int 0

# defaults write com.apple.dock wvous-tr-corner -int 4
# defaults write com.apple.dock wvous-tr-modifier -int 0

# defaults write com.apple.dock wvous-bl-corner -int 2
# defaults write com.apple.dock wvous-bl-modifier -int 0

# defaults write com.apple.dock wvous-br-corner -int 5
# defaults write com.apple.dock wvous-br-modifier -int 0

###############################################################################
# Mac App Store                                                               #
###############################################################################

# Enable the automatic update check
defaults write com.apple.SoftwareUpdate AutomaticCheckEnabled -bool true

# Download newly available updates in background
defaults write com.apple.SoftwareUpdate AutomaticDownload -int 1

# Install System data files & security updates
defaults write com.apple.SoftwareUpdate CriticalUpdateInstall -int 1

###############################################################################
# mysides (third party)													      #
###############################################################################
# Remove things I don't want
mysides remove Recents >/dev/null 2>&1
mysides remove Movies >/dev/null 2>&1
mysides remove Music >/dev/null 2>&1
mysides remove Pictures >/dev/null 2>&1

# Remove and append to maintain order
mysides remove chan >/dev/null 2>&1
mysides add chan file:///Users/chan/

mysides remove Documents >/dev/null 2>&1
mysides add Documents file:///Users/chan/Documents/

mysides remove Downloads >/dev/null 2>&1
mysides add Downloads file:///Users/chan/Downloads/

mysides remove Desktop >/dev/null 2>&1
mysides add Desktop file:///Users/chan/Desktop/

mysides remove Applications >/dev/null 2>&1
mysides add Applications file:///Applications/

###############################################################################
# Commit it!													      #
###############################################################################

killall Dock
killall Finder
