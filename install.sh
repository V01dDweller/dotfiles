#!/bin/bash

########################################################################
# WARNING! - Use at your own risk
#
#   This installs my dotfiles for bash, Vim, MinTTy & Tmux, if & it finds them.
#   Backup files will be placed in ~/dotfile_backups+date
#
# 1. Create ~/dotfile_backup.YYYY-MM-DD_HHMM-SS
# 2. Copy any dot file it will replace into that directory
# 3. Replace or create certain .bash, .vim and .tmux rc files
# 4. Run ~/dotfiles/tmux/plugin_install.sh to set up Tmux plug-ins
# 5. Run ~/dotfiles/vim/plugin_install.sh to set up Vim plug-ins
#
########################################################################

# Bash scripting tweaks credit:
#   https://vaneyckt.io/posts/safer_bash_scripts_with_set_euxo_pipefail
set -Eeuo pipefail

START_PATH=$(pwd)
REPO_PATH="$( cd "$(dirname "$0")" >/dev/null 2>&1 ; pwd -P )"

# Colors
red=$(tput setaf 1); export red
green=$(tput setaf 2); export green
yellow=$(tput setaf 3); export yellow
blue=$(tput setaf 4); export blue
purple=$(tput setaf 5); export purple
cyan=$(tput setaf 6); export cyan
white=$(tput setaf 7); export white
orange=$(tput setaf 208); export orange
reset=$(tput sgr0); export reset

# Time-stamp
currentDate=$(date +%Y-%m-%d_%H%M-%S)

# The dotfiles
bashFiles=(".bashrc" ".bash_profile" ".bash_prompt.sh" ".LESS_TERMCAP")
minttyFiles=(".minttyrc" ".bash_mintty_colors" )
vimFiles=(".vimrc" ".gvimrc")
tmuxFiles=(".tmux.conf"  ".tmux.clipboard.conf" ".tmux-status.conf")
backupFiles=("${bashFiles[@]}" "${minttyFiles[@]}" "${vimFiles[@]}" "${tmuxFiles[@]}")
backupDirectory="dotfile_backup.${currentDate}"

# Backing up existing dot files
mkdir "$HOME/$backupDirectory"

echo "Backing up current dotfiles..."
for i in "${backupFiles[@]}"
do
  if [ -f "$HOME/$i" ]
  then
    cp -pv "$HOME/$i" "$HOME/$backupDirectory"
  fi
done
echo ""

# Copying bash dot files
for i in "${bashFiles[@]}"
do
  echo Creating "$HOME/$i"
  cp -v "$REPO_PATH/bash/$i" "$HOME/$i"
done
echo ""

# Copying tmux dot files
if command -v tmux > /dev/null
then
  echo "Copying tmux dot files"
  tmuxMajorVersion=$(tmux -V|cut -d' ' -f 2|cut -d'.' -f 1)
  echo "tmux major version: $tmuxMajorVersion"

  if [ "$tmuxMajorVersion" -gt 2 ]
  then
    echo "Tmux 3.x not supported yet"
  else
    for i in "${tmuxFiles[@]}"
    do
      cp -v "$REPO_PATH/tmux/$i" "$HOME/"
    done
    echo "** Reminder: Uncomment $HOME/.tmux.clipboard.conf for your OS"
  fi
  echo ""
  # Install tmux plugins
  "$REPO_PATH/tmux/plugin_install.sh"
fi

COLOR_SCHEME="airline_original"
# Tmux theme for Linux or WSL
if [ "$OSTYPE" == "linux-gnu" ]
then
  # Linux
  if grep -qi Microsoft /proc/version
  then
    # WSL detected - yellow
    COLOR_SCHEME="yellow"
  else
    # This really is Linux - original
    COLOR_SCHEME="airline_original"
  fi
fi
cp -v "$REPO_PATH/tmux/themes/$COLOR_SCHEME/"{.tmux.conf,.tmux-status.conf,.tmux-syncoff.conf,.tmux-syncon.conf} "$HOME/"

# Copying vim dot files
if command -v vim > /dev/null
then
  # Copy .vimrc, .gvimrc
  echo "Setting up Vim"
  cp -v "$REPO_PATH/vim/"{.vimrc,.gvimrc} "$HOME/"
  echo ""
  # Install Vim plug-ins
  "$REPO_PATH/vim/plugin_install.sh"
fi

# Copying w3m dot files
if command -v w3m > /dev/null
then
  cp -vr "$REPO_PATH/.w3m" "$HOME/"
fi

# Return to the start
cd "$START_PATH"
