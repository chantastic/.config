#!/bin/zsh

echo "Setting up SSH…"

if [ -e ~/.ssh/id_ed25519 ]; then
    echo "Skipping setup_ssh"
else
    # https://docs.github.com/en/authentication/connecting-to-github-with-ssh/generating-a-new-ssh-key-and-adding-it-to-the-ssh-agent
    echo "Initializing setup_ssh"
    ssh-keygen -t ed25519 -C "$EMAIL"
    eval "$(ssh-agent -s)"
fi

if [ -e ~/.ssh/config ]; then
    echo "ssh config already exists. Skipping adding osx specific settings... "
else
    ssh-add --apple-use-keychain ~/.ssh/id_ed25519
    echo "Writing osx specific settings to ssh config... "
    ssh-keyscan github.com >>~/.ssh/known_hosts
    cat <<EOT >>~/.ssh/config
Host *
	AddKeysToAgent yes
	UseKeychain yes
	IdentityFile ~/.ssh/id_ed25519
EOT
fi
