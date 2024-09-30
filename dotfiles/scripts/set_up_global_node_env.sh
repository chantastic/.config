#!/bin/zsh

echor "Configuring global node env…"

PNPM_GLOBAL_APPS=(
    typescript
    wrangler
)

if ! command -v node >/dev/null 2>&1; then
    echo "Attempting to source node…"
    (
        echo
        echo 'eval "$(/opt/homebrew/bin/brew shellenv)"'
    ) >>~/.zprofile
    eval "$(/opt/homebrew/bin/brew shellenv)"
fi

source ~/.zprofile

if ! command -v node >/dev/null 2>&1; then
    echo "Install node first"
    exit 1
else
    corepack enable
    # https://pnpm.io/installation#using-corepac
    corepack prepare pnpm@latest --activate
    corepack prepare yarn@stable --activate

    # install other globals
    for i in $PNPM_GLOBAL_APPS; do
        # pnpm outdated -g $i &>/dev/null
        # if [ $? -eq 0 ]; then
        # 	echo "Skipping $i. Already up to date"
        # else
        pnpm install -g $i@latest
        # fi
    done

fi
