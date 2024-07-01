#!/usr/bin/env bash

# Get the aliases and functions
if [ -f "$HOME/.bashrc" ]; then
  . "$HOME/.bashrc"
fi

# User specific environment and startup programs
PATH=$HOME/bin:$HOME/.local/bin:$HOME/.local/lib:$PATH
export PATH

# Add Homebrew to the PATH\
if [ -d /opt/homebrew/bin ]; then
  export PATH=/opt/homebrew/bin:$PATH
fi

# MacOS GNU cureutils, e.g. after running 'brew install coreutils'
if [ -d /opt/homebrew/Cellar/coreutils/9.3/bin ]; then
  export PATH=/opt/homebrew/Cellar/coreutils/9.3/bin:/opt/homebrew/Cellar/ncurses/6.4/bin/:$PATH
fi

# MacOS stop telling me about zsh
# credit: https://www.addictivetips.com/mac-os/hide-default-interactive-shell-is-now-zsh-in-terminal-on-macos/
export BASH_SILENCE_DEPRECATION_WARNING=1

# History setttins
export HISTTIMEFORMAT="%m/%d/%y %T "
export HISTSIZE=10000000
export HISTFILESIZE=10000000
shopt -s histappend
PROMPT_COMMAND="history -a;$PROMPT_COMMAND"

export TERM=xterm-256color
umask 022

# If promptline.vim was used then create airline prompt
if [ -f "$HOME/.bash_prompt.sh" ]
then
  source "$HOME/.bash_prompt.sh"
fi

# Set up Homebrew
if [ -d /opt/homebrew/bin/brew ]
then
  eval "$(/opt/homebrew/bin/brew shellenv)"
fi

# Set up vyenv
if [ -f "$HOME/.venv/bin/activate" ]
then
  source "$HOME/.venv/bin/activate"
fi

# Activate NodeJS via nodeenv
if [ -f "$HOME/.node/bin/activate" ]
then
  source "$HOME/.node/bin/activate"
fi

LANG=C.UTF-8; export LANG
