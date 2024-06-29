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

# Add MacOS NodeJS to PATH
if [ -d /opt/homebrew ]; then
  NODE_PATH=$(ls -d /opt/homebrew/Cellar/node\@18/*/bin | tail -1)
fi

# Add .local NodeJS to PATH, if it exists
if [ -d $HOME/.local ]; then
  NODEPATH=$(find $HOME/.local -maxdepth 1 -type d -iname "*node*"|head -n 1)
  PATH=$NODEPATH/bin:$PATH
  export PATH
fi

if [ -d "$NODE_PATH" ];then
  export PATH=$NODE_PATH:$PATH
fi

# MacOS GNU cureutils, e.g. after running 'brew install coreutils'
if [ -d /opt/homebrew/Cellar/coreutils/9.3/bin ]; then
  export PATH=/opt/homebrew/Cellar/coreutils/9.3/bin:/opt/homebrew/Cellar/ncurses/6.4/bin/:$PATH
fi

# MacOS stop telling me about zsh
# credit: https://www.addictivetips.com/mac-os/hide-default-interactive-shell-is-now-zsh-in-terminal-on-macos/
export BASH_SILENCE_DEPRECATION_WARNING=1

# Add Linux NodeJS to PATH
if [ -d "$HOME/.local/node" ]
then
  PATH=$HOME/.local/node/bin:$PATH
  export PATH
fi

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

# Set up pyenv
if [ -d "$HOME/.pyenv" ]
then
  export PYENV_ROOT="$HOME/.pyenv"
  export PATH="$PYENV_ROOT/bin:$PATH"
  eval "$(pyenv init --path)"
fi

LANG=C.UTF-8; export LANG
