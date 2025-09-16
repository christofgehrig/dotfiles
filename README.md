# Dotfiles configurations

This repository contains dotfiles to use zsh as shell, tmux as terminal
multiplexer, and fzf as command-line fuzzy finder among several
smaller configurations.

## "Installation"

Check out the dotfiles repository in existing home directory and update the
submodules:

```bash
    cd && git init -b main                                                # Initialize git repository
    git remote add origin https://github.com/christofgehrig/dotfiles.git  # Add remote
    git fetch origin && git checkout -t origin/main                       # Fetch and checkout main branch
    git submodule update --init                                           # Initialize and update submodules
    ~/.fzf/install --key-bindings --completion --no-update-rc --no-bash   # Install fuzzy finder (optional)
```
