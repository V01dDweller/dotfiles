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
TMUX_DIR = (HOME_DIR + '/.tmux')
PLUGINS_DIR = (TMUX_DIR + '/plugins')

if not os.path.exists(PLUGINS_DIR):
    print('Creating ' + TMUX_DIR + '\n')
    os.mkdir(TMUX_DIR)
    os.mkdir(PLUGINS_DIR)
else:
    print(PLUGINS_DIR + ' already exists\n')

# Clone/update tpm
TPM_REPO_URL = 'https://github.com/tmux-plugins/tpm/'
TPM_DIR = (TMUX_DIR + '/plugins/tpm')

if not os.path.exists(TPM_DIR):
    os.system('git clone --depth 1 ' + TPM_REPO_URL + ' ' + TPM_DIR)
else:
    START_DIR = (os.getcwd())
    print('Repo already cloned, pulling updates\n')
    os.chdir(TPM_DIR)
    os.system('git pull')
    os.chdir(START_DIR)
