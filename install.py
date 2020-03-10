#!/usr/bin/env python3

"""Install my dotfiles"""

import os
from datetime import datetime

# Setup for a bash git-aware prompt
START_DIR = (os.getcwd())
HOME_DIR = os.environ['HOME']
BASH_PATH = (HOME_DIR + './bash')
GITAWARE_PATH = (BASH_PATH + '/git-aware-prompt')
GITAWARE_REPO = 'git://github.com/jimeh/git-aware-prompt.git'

if os.path.exists(BASH_PATH):
    print('Found ~/.bash, checking for ~/.bash/git-aware-prompt')
    if os.path.exists(GITAWARE_PATH):
        print('Found the git-aware-prompt, updating...')
        os.chdir(GITAWARE_PATH)
        os.system('git pull')
        print(' ')
        os.chdir(START_DIR)
    else:
        print('Didn\'t find git-aware-prompt,')
        print('Cloning it now')
        os.chdir(BASH_PATH)
        os.system('git clone ' + GITAWARE_REPO)
        os.chdir(START_DIR)
        print(' ')
else:
    print('Didn\'t find ~/.bash, creating it now...')
    os.mkdir(BASH_PATH)
    os.chdir(BASH_PATH)
    os.system('git clone ' + GITAWARE_REPO)
    print(' ')
    os.chdir(START_DIR)

# Current date and time
NOW = datetime.now()
TIME_STAMP = NOW.strftime('%Y-%m-%d_%H:%M:%S')

# Dotfile lists
BASH_FILES = [
        '.bashrc',
        '.bash_profile',
        '.LESS_TERMCAP'
        ]
MINTTY_FILES = [
        '.minttyrc',
        '.bash_mintty_colors'
        ]
VIM_FILES = [
        '.vimrc',
        '.gvimrc'
        ]
TMUX_FILES = [
        '.tmux.conf',
        '.tmux-syncoff.conf',
        '.tmux-syncon.conf',
        '.tmux.clipboard.conf'
        ]
BACKUP_FILES = BASH_FILES + MINTTY_FILES + VIM_FILES + TMUX_FILES
BACKUP_DIRECTORY = HOME_DIR + '/dotfile_backup_' + TIME_STAMP

# Dotfile backup
print('Creating ' + BACKUP_DIRECTORY)
os.mkdir(BACKUP_DIRECTORY)
for i in BACKUP_FILES:
    if os.path.exists(HOME_DIR + '/' + i):
        CURRENT_FILE = HOME_DIR + '/' + i
        print('Backing up ' + i)
        os.system('cp -v ' + CURRENT_FILE + ' ' + BACKUP_DIRECTORY)
    print(' ')

# Setting up bash
print('Setting up bash')
