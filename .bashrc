#!/usr/bin/env bash

# Test for non-interactive shells
[[ $- == *i* ]] || return 0

if which rbenv &> /dev/null; then eval "$(rbenv init -)"; fi

# Set up pyenv and pyenv-virtualenv.
if which pyenv &> /dev/null; then
    eval "$(pyenv init -)"
fi

# Add Python packages to PATH.
PATH="$HOME/.pyenv/bin:$PATH"

export PATH
