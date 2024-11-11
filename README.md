# chantastic .config

I have some old [dotfiles](https://github.com/chantastic/.dotfiles).  
But I've moved everything to [./config](https://github.com/chantastic/.config) now that it's a standard place for apps to dump conf.

# Ignorance is bliss

I'm intentionally ignoring known config directories.  
Choosing what I'd like to host is a balance.  
There are a number of secrets and tokens stored in this directory.  
And a deluge of tmp files.

So I'm blocklisting and adding back exactly what I need.

## 2024 August Notes

- Add remote `prepare` script that can be run remotely
  - clone `.dotfiles` and `.config` repos so that they are in place (can the be cloned with `ssh` before ssh is setup with GitHub?)
  - add prompt to set `.zshrc` with `MACHINE` env var
  - `brew bundle` from cloned repo (can't read remote)
  - `rcup` dotfiles (move into config?)
  - source dotfiles
    - commands with fail without node properly sourced (and that exists in dotfils)
    - git steps require git from homebrew (likely)

### Possible order of operations

- Set `.zshrc` with `MACHINE` to capture correct brew packages
- Install `git` and `rcm` (could these be done via remote script before `brew bundle` step?)
- Install homebrew
- Clone `.config` into HOME before dotfiles (important because Atuin will write to the `.config` directory, making it unable to be cloned to)
- `rcup`
- `source .zshprofile` (and others) to run commands
- `ssh` and git setup
- clone projects
- Node setup (`corepack enable`)
- macOS options
