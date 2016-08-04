#!/bin/bash

ulimit -u 256

# default permissions
umask 0077

# load the shell dotfiles:
for file in ~/.{bash_aliases,bash_completion,bash_exports,bash_functions,bash_prompt}; do
  [ -r "$file" ] && source "$file"
done
unset file

# Case-insensitive globbing (used in pathname expansion)
shopt -s nocaseglob;

# check the window size after each command and, if necessary,
# update the values of LINES and COLUMNS.
shopt -s checkwinsize

# append to the history file, don't overwrite it
shopt -s histappend


# if homebrew installed
if [ -f /usr/local/bin/brew ]; then
  # symlink to /Applications
  export HOMEBREW_CASK_OPTS="--appdir=/Applications"
fi

eval "$(rbenv init -)"
eval "$(docker-machine env)"