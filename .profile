# If running interactively, don't do anything
case "$-" in
    *i*) ;;
    *) return ;;
esac

# Set default shell to Zsh if available
if [ -x /bin/zsh ]; then
    export SHELL=/bin/zsh
elif [ -x ~/.local/bin/zsh ]; then
    export SHELL=~/.local/bin/zsh
elif [ -x ~/bin/zsh ]; then
    export SHELL=~/bin/zsh
fi

# Switch to Zsh only if it's not already running
if [ -z "$ZSH_VERSION" ] && [ -x "$SHELL" ] && [ "$SHLVL" -eq 1 ]; then
    exec "$SHELL" -l
fi

