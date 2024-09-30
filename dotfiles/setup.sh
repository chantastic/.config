#!/bin/zsh

# INSTRUCTIONS
##############

## RUN REMOTELY
# /bin/zsh -c "$(curl -fsSL https://raw.githubusercontent.com/chantastic/.dotfiles/master/setup.sh)"

# MAKE SCRIPT EXECUTABLE
# https://linuxopsys.com/topics/make-bash-script-executable-using-chmod
# chmod u+x setup.sh
# run with ./setup.sh

EMAIL=mijoch@gmail.com

# EXECUTE ALL
#############

. ~/.dotfiles/scripts/install_or_update_homebrew.sh
brew bundle --file="~/.Brewfile"

. ~/.dotfiles/scripts/setup_ssh.sh
. ~/.dotfiles/scripts/setup_gh.sh

. ~/.dotfiles/scripts/setup_gh.sh
. ~/.dotfiles/scripts/set_up_global_node_env.sh

. ~/.dotfiles/scripts/set_macos_dock.sh
. ~/.dotfiles/scripts/set_macos_preferences.sh
. ~/.dotfiles/scripts/configure_macos_login_items.sh

# MANUAL FOLLOW-UPS
###################

# Launch Safari. Enable extensions.
# Launch magnet. Give permissions and enable at startup.
# Launch one Affinity Product. Apply license.
# Launch CleanShot. Give permissions and enable at startup.
# Launch Raycast. Login. Change default command to CMD+Space.
# Launch Obsidian. Settings > General > Commercial License > Activate
#
# System Settings
# > Keyboard > Shortcuts > Input Sources > Disabled All [frees up Things quick input]
# > Keyboard > Screenshots > Disable All [frees up Cleanshot]. Then set Cleanshot shortcuts in Cleanshot preferences.
#
# Install Davinc Resolve Studio. Add license
# Setup Finder preferences
# Keyboard shortcuts >
# - Keyboard > Press 🌐 key to: select `Change Input Source`.
# - Unregister `⌘^Space` (https://www.reddit.com/r/MacOS/comments/15j3pza/comment/juxx8ib/?utm_source=share&utm_medium=web3x&utm_name=web3xcss&utm_term=1&utm_content=share_button).
#   - Register to ^⌥⌘Space so still available.
#   - Add keyboard system keyboard shortcut to Raycast alias (if not coming from shared settings).
# Privacy >
# - Screen & System Audio Recording >
#   - Enable CleanShot X

# Move 1Password shortcuts around `/`
# - Show Quick Access: ⌘ shift \
# - Autofill: ^ shift \
# - ⌘\ should be open in new view, VS Code

# REFERENCES
############

# https://github.com/mathiasbynens/dotfiles/blob/master/.macos
# https://github.com/gricard/new-mac/blob/master/setup.sh
# https://macowners.club/posts/sane-defaults-for-macos/
