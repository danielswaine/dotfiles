#!/usr/bin/env bash

for file in ~/.{bashrc,bash_prompt,exports,aliases,functions,secrets,extras}; do
  [ -r "$file" ] && [ -f "$file" ] && source "$file";
done;
unset file;
