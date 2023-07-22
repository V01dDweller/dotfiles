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

# Install Tmux Plugin Manager

# Create "$HOME"/.tmux/plugins directory, if needed
if [ ! -d "$HOME"/.tmux/plugins ]
then
  echo "Creating $HOME/.tmux/plugins directory"
  mkdir -pv "$HOME"/.tmux/plugins
fi

# Clone or update tpm
if [ ! -d "$HOME"/.tmux/plugins/tpm ]
then
  echo "Cloning tpm (Tmux plugin manager) from GitHub"
  git clone --depth 1 https://github.com/tmux-plugins/tpm "$HOME"/.tmux/plugins/tpm
else
  echo "Pulling tpm updates"
  cd "$HOME"/.tmux/plugins/tpm
  git pull
  echo " "
fi

# Install/update tmux-cluster plugin
if [ ! -d "$HOME"/.tmux/plugins/tmux-cluster ]
then
  git clone https://github.com/davidscholberg/tmux-cluster.git "$HOME"/.tmux/plugins/tmux-cluster
else
  echo "Pulling tmux-cluster updates"
  cd "$HOME"/.tmux/plugins/tmux-cluster
  git pull
  echo " "
fi

# Creating "$HOME"/.local/bin directory, if needed
if [ ! -d "$HOME"/.local/bin ]
then
  echo "Creating $HOME/.local/bin directory"
  mkdir -pv "$HOME"/.local/bin
fi
fi
