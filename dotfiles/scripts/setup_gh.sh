#!/bin/zsh

echo "Signing into GitHub (with gh)…"

# https://cli.github.com/manual/gh_auth_login
# logging in will automatically prompt to add ssh keys
# https://stackoverflow.com/a/73465507

if ! command -v gh >/dev/null 2>&1; then
    echo "Install gh first"
    exit 1
fi

if ! gh auth status >/dev/null 2>&1; then
    gh auth login -p ssh -w
else
    echo "Logged into GitHub. Skipping..."
fi
