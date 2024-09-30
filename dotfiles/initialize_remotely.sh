#!/bin/zsh

## RUN REMOTELY
# /bin/zsh -c "$(curl -fsSL https://raw.githubusercontent.com/chantastic/.dotfiles/master/initialize_remotely.sh)"

install_or_update_homebrew() {
    which -s brew
    if [[ $? != 0 ]]; then
        echo "Installing homebrew..."
        /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
    else
        echo "Updating brew..."
        brew upgrade
    fi
}

clone_config() {
    if [ -d ~/.config ]; then
        echo ".config installed at path ~/.config"
    else
        echo "installing .config"
        git clone git@github.com:chantastic/.config.git
    fi
}

clone_dotfiles() {
    # https://www.perplexity.ai/search/i-use-the-library-rcm-to-manag-eu.0jj07R3u4ArwGoLJneA
    # TODO: I've made changes to dotfiles. so that they are now local. But this will require that a `.rcrc` file is initiated with path data. Because this file will be written, it's entire contents will need to be written. This will includes any "UNDOTTED" properties for Brewfile.
    if [ -d ~/.dotfiles ]; then
        echo ".dotfiles installed at path ~/.dotfiles"
    else
        echo "Installing .dotfiles…"
        git clone git@github.com:chantastic/.dotfiles.git ~/.dotfiles
    fi

    rcup -v -d ~/.dotfiles
}

clone_sites() {
    if [ -d ~/sites ]; then
        echo "sites installed at path ~/sites"
    else
        echo "Installing sites…"
        git clone git@github.com:chantastic/sites.git ~/sites
    fi
}

echo "Installing Homebrew…"
install_or_update_homebrew

echo "Cloning critical git repositories…"
clone_config
clone_dotfiles
clone_sites
