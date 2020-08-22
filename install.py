#!/usr/bin/env python3
"""
# Install my dotfiles #

    This installs my dotfiles for bash, Vim, MinTTy &  Tmux, if &  it finds
    them. Backup files will be placed in ~/dotfile_backups+date

    1. Create ~/dotfile_backup.YYYY-MM-DD_HHMM-SS
    2. Copy any dot file it will replace into that directory
    3. Create a ~/.bash directory for a git-aware prompt
    4. Clone git://github.com/jimeh/git-aware-prompt.git into it
    5. Replace or create .bash, .vim and .tmux rc files from the lists below
    6. Run ~/dotfiles/tmux/plugin_install.sh to set up Tmux plug-ins
    7. Run ~/dotfiles/vim/plugin_install.sh to set up Vim plug-ins
"""

import os
from datetime import datetime

# Setup for a bash git-aware prompt
START_PATH = (os.getcwd())
REPO_PATH = (os.path.dirname(os.path.realpath(__file__)))
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
        os.chdir(START_PATH)
    else:
        print('Didn\'t find git-aware-prompt,')
        print('Cloning it now')
        os.chdir(BASH_PATH)
        os.system('git clone --depth 1' + GITAWARE_REPO)
        os.chdir(START_PATH)
        print(' ')
else:
    print('Didn\'t find ~/.bash, creating it now...')
    os.mkdir(BASH_PATH)
    os.chdir(BASH_PATH)
    os.system('git clone --depth 1' + GITAWARE_REPO)
    print(' ')
    os.chdir(START_PATH)

# Current date and time
NOW = datetime.now()
TIME_STAMP = NOW.strftime('%Y-%m-%d_%H:%M:%S')

# The dotfiles
BASH_FILES = [
        '.bashrc',
        '.bash_profile',
        '.bash_prompt.sh',
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
        '.tmux.clipboard.conf',
        '.tmux-status.conf'
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
for i in BASH_FILES:
    print('Creating ' + HOME_DIR + "/" + i)
    os.system('cp -v ' + REPO_PATH + '/bash/' + i + " " + HOME_DIR + '/' + i)
