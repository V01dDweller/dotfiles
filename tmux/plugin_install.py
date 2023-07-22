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
    print(COLOR["green"] + 'Creating ' + TMUX_DIR + '\n' + COLOR["reset"])
    os.mkdir(TMUX_DIR)
    os.mkdir(PLUGINS_DIR)
    print(" ")
else:
    print(COLOR["green"] + PLUGINS_DIR + ' already exists\n' + COLOR["reset"])
    print(" ")

# Clone/update Tmux plugin manager
TPM_REPO_URL = 'https://github.com/tmux-plugins/tpm/'
TPM_DIR = TMUX_DIR + '/plugins/tpm'

if not os.path.exists(TPM_DIR):
    print(COLOR["green"] + 'Cloning tpm (Tmux plugin manager) from GitHub\n' + COLOR["reset"])
    os.system('git clone --depth 1 ' + TPM_REPO_URL + ' ' + TPM_DIR)
else:
    print(COLOR["green"] + 'Pulling tpm updates\n' + COLOR["reset"])
    os.chdir(TPM_DIR)
    os.system('git pull')
    os.chdir(START_DIR)
    print(" ")

# Install/update tmux-cluster plugin
CLUSTER_REPO_URL = 'https://github.com/davidscholberg/tmux-cluster.git'
CLUSTER_DIR = TMUX_DIR + '/plugins/tmux-cluster'
if not os.path.exists(CLUSTER_DIR):
    print(COLOR["green"] + 'Cloning tmux-cluster from GitHub\n' + COLOR["reset"])
    os.system('git clone --depth 1 ' + CLUSTER_REPO_URL + ' ' + CLUSTER_DIR)
    print(" ")
else:
    print(COLOR["green"] + 'Pulling tmux-cluster updates\n' + COLOR["reset"])
    os.chdir(CLUSTER_DIR)
    os.system('git pull')
    os.chdir(START_DIR)
    print(" ")

# Create $HOME/.local/bin
LOCAL_BIN_DIR = HOME_DIR + '/.local/bin'
if not os.path.exists(LOCAL_BIN_DIR):
    print(COLOR["green"] + 'Creating ' + LOCAL_BIN_DIR + '\n' + COLOR["reset"])
    os.mkdir(LOCAL_BIN_DIR)
    print(" ")
else:
    print(COLOR["green"] + LOCAL_BIN_DIR + ' already exists\n' + COLOR["reset"])
    print(" ")

# Downloading tmc script
TMC_SCRIPT_URL = 'https://raw.githubusercontent.com/davidscholberg/tmux-cluster/master/tmc'
TMC_SCRIPT = LOCAL_BIN_DIR + '/tmc'
if not os.path.exists(TMC_SCRIPT):
    print(COLOR["green"] + 'Downloading tmc script\n' + COLOR["reset"])
    os.system('wget ' + TMC_SCRIPT_URL + ' -O ' + TMC_SCRIPT)
    os.system('chmod +x ' + TMC_SCRIPT)
    print(" ")
else:
    print(COLOR["green"] + 'tmc script already installed\n' + COLOR["reset"])
