# Dotfiles

Check out the dotfiles repository in existing home directory and update the
submodules:

    cd && git init
    git remote add origin git@github.com:christofgehrig/dotfiles.git
    git fetch origin && git checkout -t origin/main
    git submodule update --init

Install .fzf:

    ~/.fzf/install