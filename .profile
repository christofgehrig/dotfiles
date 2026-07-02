# If not running interactively, don't do anything
case "$-" in
    *i*) ;;
    *) return ;;
esac

# Reuse a standard SSH agent if the login shell did not export one.
if [ -z "$SSH_AUTH_SOCK" ]; then
    ssh_agent_env="${XDG_RUNTIME_DIR:-$HOME/.ssh}/ssh-agent.env"
    if [ -r "$ssh_agent_env" ]; then
        . "$ssh_agent_env" >/dev/null
    fi

    ssh-add -l >/dev/null 2>&1
    ssh_agent_status=$?
    if [ "$ssh_agent_status" -eq 2 ] && command -v ssh-agent >/dev/null 2>&1; then
        ssh-agent -s > "$ssh_agent_env"
        . "$ssh_agent_env" >/dev/null
    fi
    unset ssh_agent_env ssh_agent_status
fi

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
