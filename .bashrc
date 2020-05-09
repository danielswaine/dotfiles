#!/usr/bin/env bash

# Test for non-interactive shells
[[ $- == *i* ]] || return 0

if which rbenv &> /dev/null; then eval "$(rbenv init -)"; fi
