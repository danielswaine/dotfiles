# Env variables
export HISTCONTROL=ignoreboth  # Forget duplicate and space-prefixed commands.
export HISTFILESIZE=1000  # Maximum number of commands saved in .bash_history.
export HISTSIZE=500  # Maximum number of commands to remember from one session.

# Highlight manual pages
export LESS_TERMCAP_md=$(printf '\e[01;31m') # enter double-bright mode - bold, red
export LESS_TERMCAP_us=$(printf '\e[04;36m') # enter underline mode - cyan

# Enable colour for 'grep' output
export GREP_OPTIONS="--color=auto"

export PATH="$PATH:$HOME/.rvm/bin" # Add RVM to PATH for scripting
