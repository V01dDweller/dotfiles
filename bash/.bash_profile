#!/usr/bin/env bash

# Get the aliases and functions
if [ -f ~/.bashrc ]; then
  . ~/.bashrc
fi

# User specific environment and startup programs
PATH=$HOME/bin:$HOME/.local/bin:$HOME/.local/lib:$PATH
export PATH

# Add Homebrew to the PATH\
if [ -d /opt/homebrew/bin ]; then
  export PATH=/opt/homebrew/bin:$PATH
fi

# Add NodeJS to PATH
NODE_PATH=$(ls -d /opt/homebrew/Cellar/node\@18/*/bin | tail -1)

if [ -d $NODE_PATH ];then
  export PATH=$NODE_PATH:$PATH
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

# Colors

txtgry=`tput setaf 8`
reset=`tput sgr0`
txtlem="$(tput setaf 190 2>/dev/null || echo '\e[0;37m')"  # Lemon yellow

# OS Prompt colors
case $OSTYPE in
  aix)
    # AIX
    usercolor=$bldylw
    hostcolor=$txtblu
    ;;
  bsd|freebsd)
    # BSD, FreeBSD
    usercolor=$bldylw
    hostcolor=$txtgrn
    ;;
  cygwin)
    # Cygwin
    usercolor=$bldylw
    hostcolor=$txtgrn
    ;;
  darwin19.4.0)
    # MacOS
    usercolor=$txtcyn
    hostcolor=$txtpur
    ;;
  linux-gnu)
    if grep -q Microsoft /proc/version
    then
      # WSL detected
      usercolor=$bldylw
      hostcolor=$bldylw
    else
      # Linux
      usercolor=$bldcyn
      hostcolor=$bldpur
    fi
    ;;
  msys)
    # MinGW/GitBash
    usercolor=$bldylw
    hostcolor=$bldgrn
    ;;
  solaris)
    # Solaris
    usercolor=$bldylw
    hostcolor=$bldred
    ;;
  *)
    # Anything else
    usercolor=$bldylw
    hostcolor=$txtgrn
    ;;
esac

if [[ $EUID -eq 0 ]]; then
   usercolor=$bldred
fi

pathcolor=$bldblu

# If promptline.vim was used then create airline prompt
if [ -f $HOME/.bash_prompt.sh ]
then
  source ~/.bash_prompt.sh
fi
