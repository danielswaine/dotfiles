# Env variables
export HISTCONTROL=ignoreboth  # Forget duplicate and space-prefixed commands.
export HISTFILESIZE=1000  # Maximum number of commands saved in .bash_history.
export HISTSIZE=500  # Maximum number of commands to remember from one session.

# Enable colour for 'grep' output
export GREP_OPTIONS="--color=auto"

export PATH="$PATH:$HOME/.rvm/bin" # Add RVM to PATH for scripting

if [ -f "$HOME/.secrets" ]; then
   . "$HOME/.secrets"
fi

# export LESS_TERMCAP_mb=$(printf '\e[01;31m') # enter blinking mode - red
# export LESS_TERMCAP_md=$(printf '\e[01;35m') # enter double-bright mode - bold, magenta
# export LESS_TERMCAP_me=$(printf '\e[0m') # turn off all appearance modes (mb, md, so, us)
# export LESS_TERMCAP_se=$(printf '\e[0m') # leave standout mode
# export LESS_TERMCAP_so=$(printf '\e[01;33m') # enter standout mode - yellow
# export LESS_TERMCAP_ue=$(printf '\e[0m') # leave underline mode
# export LESS_TERMCAP_us=$(printf '\e[04;36m') # enter underline mode - cyan
