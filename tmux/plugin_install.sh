#!/bin/bash
########################################################################
# WARNING! - Use at your own risk
#
# This script will:
#
# 1. Create a "$HOME"/.tmux/plugins directory
# 2. Install tpm (TMux Plugin Manager) via github
# 3. Install the tmc plugin for Tmux clusters
#
########################################################################


# Bash scripting tweaks credit:
#   https://vaneyckt.io/posts/safer_bash_scripts_with_set_euxo_pipefail
set -Eeuo pipefail

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

# Install Tmux Plugin Manager

# Create "$HOME"/.tmux/plugins directory, if needed
if [ ! -d "$HOME"/.tmux/plugins ]
then
  echo "$green"Creating "$HOME"/.tmux/plugins directory"$reset"
  mkdir -pv "$HOME"/.tmux/plugins
  echo " "
else
  echo "$green""$HOME"/.tmux/plugins directory already exists"$reset"
  echo " "
fi

# Clone or update tpm
if [ ! -d "$HOME"/.tmux/plugins/tpm ]
then
  echo "$green"Cloning Tmux plugin manager from GitHub"$reset"
  git clone --depth 1 https://github.com/tmux-plugins/tpm "$HOME"/.tmux/plugins/tpm
  echo " "
else
  echo "$green"Pulling tpm updates"$reset"
  cd "$HOME"/.tmux/plugins/tpm
  git pull
  echo " "
fi

# Install/update tmux-cluster plugin
if [ ! -d "$HOME"/.tmux/plugins/tmux-cluster ]
then
  git clone https://github.com/davidscholberg/tmux-cluster.git "$HOME"/.tmux/plugins/tmux-cluster
else
  echo "$green"Pulling tmux-cluster updates"$reset"
  cd "$HOME"/.tmux/plugins/tmux-cluster
  git pull
  echo " "
fi

# Creating "$HOME"/.local/bin directory, if needed
if [ ! -d "$HOME"/.local/bin ]
then
  echo "$green"Creating $HOME/.local/bin directory"$reset"
  mkdir -pv "$HOME"/.local/bin
  echo " "
else
  echo "$green$HOME"/.local/bin directory already exists"$reset"
  echo " "
fi

# Downloading tmc script
if [ ! -f "$HOME"/.local/bin/tmc ]
then
  echo "$green"Downloading tmc script"$reset"
  curl -o "$HOME"/.local/bin/tmc https://raw.githubusercontent.com/davidscholberg/tmux-cluster/master/tmc
  chmod +x "$HOME"/.local/bin/tmc
  echo " "
else
  echo "$green"tmc script already installed"$reset"
  echo " "
fi
