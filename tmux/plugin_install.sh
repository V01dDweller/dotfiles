#!/bin/bash

# Install Tmux Plugin Manager

# Create ~/.tmux/plugins directory, if needed
if [ ! -d ~/.tmux/plugins ]
then
  mkdir -pv ~/.tmux/plugins
fi

# Clone or update tpm
if [ ! -d ~/.tmux/plugins/tpm ]
then
  git clone https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm
else
  cd ~/.tmux/plugins/tpm
  git pull
fi

# Clone/update tmc
if [ ! -d ~/.tmux/plugins/tmux-cluster ]
then
  git clone https://github.com/davidscholberg/tmux-cluster.git ~/.tmux/plugins/tmux-cluster
fi
