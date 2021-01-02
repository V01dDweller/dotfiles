#!/bin/bash
########################################################################
# WARNING! - Use at your own risk
#
# This script will:
#
# 1. Create a ~/.tmux/plugins directory
# 2. Install tpm (TMux Plugin Manager) via github
# 3. Install the tmc plugin for Tmux clusters
#
########################################################################


# Bash scripting tweaks credit:
#   https://vaneyckt.io/posts/safer_bash_scripts_with_set_euxo_pipefail
set -Eeuo pipefail

# Install Tmux Plugin Manager

# Create ~/.tmux/plugins directory, if needed
if [ ! -d ~/.tmux/plugins ]
then
  mkdir -pv ~/.tmux/plugins
fi

# Clone or update tpm
if [ ! -d ~/.tmux/plugins/tpm ]
then
  git clone --depth 1 https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm
else
  cd ~/.tmux/plugins/tpm
  git pull
fi

# Clone/update tmc
if [ ! -d ~/.tmux/plugins/tmux-cluster ]
then
  git clone https://github.com/davidscholberg/tmux-cluster.git ~/.tmux/plugins/tmux-cluster
fi
