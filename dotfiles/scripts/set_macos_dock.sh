#!/bin/zsh

echo "Setting macOS dock…"

dockutil --remove all >/dev/null 2>&1

# to add:
# dockutil --add /System/Applications/Messages.app > /dev/null 2>&1
