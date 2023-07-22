#!/usr/bin/env python3

""" Install Tmux Plugin Manager """

import os


COLOR = {
    "red": "\u001b[31;1m",
    "green": "\u001b[32;1m",
    "yellow": "\u001b[33;1m",
    "blue": "\u001b[34;1m",
    "magenta": "\u001b[35;1m",
    "cyan": "\u001b[36;1m",
    "white": "\u001b[37;1m",
    "reset": "\u001b[0m"
    }

HOME_DIR = os.environ['HOME']
TMUX_DIR = HOME_DIR + '/.tmux'
PLUGINS_DIR = TMUX_DIR + '/plugins'
START_DIR = os.getcwd()

if not os.path.exists(PLUGINS_DIR):
    print('Creating ' + TMUX_DIR + '\n')
    os.mkdir(TMUX_DIR)
    os.mkdir(PLUGINS_DIR)
else:
    print(PLUGINS_DIR + ' already exists\n')

# Clone/update Tmux plugin manager
TPM_REPO_URL = 'https://github.com/tmux-plugins/tpm/'
TPM_DIR = TMUX_DIR + '/plugins/tpm'

if not os.path.exists(TPM_DIR):
    os.system('git clone --depth 1 ' + TPM_REPO_URL + ' ' + TPM_DIR)
else:
    print('Pulling tpm updates\n')
    os.chdir(TPM_DIR)
    os.system('git pull')
    os.chdir(START_DIR)

# Install/update tmux-cluster plugin
CLUSTER_REPO_URL = 'https://github.com/davidscholberg/tmux-cluster.git'
CLUSTER_DIR = TMUX_DIR + '/plugins/tmux-cluster'
if not os.path.exists(CLUSTER_DIR):
    print('Cloning tmux-cluster from GitHub\n')
    os.system('git clone --depth 1 ' + CLUSTER_REPO_URL + ' ' + CLUSTER_DIR)
    print(" ")
else:
    print('Pulling tmux-cluster updates\n')
    os.chdir(CLUSTER_DIR)
    os.system('git pull')
    os.chdir(START_DIR)
    print(" ")

# Create $HOME/.local/bin
LOCAL_BIN_DIR = HOME_DIR + '/.local/bin'
if not os.path.exists(LOCAL_BIN_DIR):
    print('Creating ' + LOCAL_BIN_DIR + '\n')
    os.mkdir(LOCAL_BIN_DIR)
    print(" ")

# Downloading tmc script
TMC_SCRIPT_URL = 'https://raw.githubusercontent.com/davidscholberg/tmux-cluster/master/tmc'
TMC_SCRIPT = LOCAL_BIN_DIR + '/tmc'
if not os.path.exists(TMC_SCRIPT):
    print('Downloading tmc script\n')
    os.system('wget ' + TMC_SCRIPT_URL + ' -O ' + TMC_SCRIPT)
    os.system('chmod +x ' + TMC_SCRIPT)
    print(" ")
else:
    print('tmc script already installed\n')
