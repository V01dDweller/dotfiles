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
import platform
import subprocess
from datetime import datetime


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


# Store starting directory and repo directory
HOME_DIR = os.environ['HOME']
START_PATH = (os.getcwd())
REPO_PATH = (os.path.dirname(os.path.realpath(__file__)))

# OS detection
OSTYPE = platform.system()

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

# Backups
print (color.CYAN + '-------' + color.RESET)
print (color.CYAN + 'Backups' + color.RESET)
print (color.CYAN + '-------' + color.RESET)
BACKUP_FILES = BASH_FILES + MINTTY_FILES + VIM_FILES + TMUX_FILES
BACKUP_DIRECTORY = HOME_DIR + '/dotfile_backup_' + TIME_STAMP

# Backing up existing dot files
os.mkdir(BACKUP_DIRECTORY)
for i in BACKUP_FILES:
    CURRENT_FILE = HOME_DIR + '/' + i
    if os.path.exists(CURRENT_FILE):
        os.system('cp -v ' + CURRENT_FILE + ' ' + BACKUP_DIRECTORY)
    print(' ')

#
# Bash
#
print(color.CYAN + '----' + color.RESET)
print(color.CYAN + 'Bash' + color.RESET)
print(color.CYAN + '----' + color.RESET)

# Setup for a basic bash git-aware prompt
BASH_PATH = (HOME_DIR + '/.bash')
GITAWARE_PATH = (BASH_PATH + '/git-aware-prompt')
GITAWARE_REPO = 'https://github.com/jimeh/git-aware-prompt.git'

if os.path.exists(BASH_PATH):
    print(color.GREEN +
          'Found ~/.bash, checking for ~/.bash/git-aware-prompt...' +
          color.RESET)
    if os.path.exists(GITAWARE_PATH):
        print(color.GREEN + 'Found the git-aware-prompt, updating...' +
              color.RESET)
        os.chdir(GITAWARE_PATH)
        os.system('git pull')
        print(' ')
        os.chdir(START_PATH)
    else:
        print(color.YELLOW + 'Didn\'t find git-aware-prompt,' + color.RESET)
        print('Cloning it now')
        os.chdir(BASH_PATH)
        os.system('git clone --depth 1 ' + GITAWARE_REPO)
        os.chdir(START_PATH)
        print(' ')
else:
    print(color.YELLOW + 'Didn\'t find ~/.bash, creating it now...' +
          color.RESET)
    os.mkdir(BASH_PATH)
    os.chdir(BASH_PATH)
    os.system('git clone --depth 1 ' + GITAWARE_REPO)
    print(' ')
    os.chdir(START_PATH)

# Copying bash dot files
print(color.GREEN + 'Copying bash dot files' + color.RESET)
for i in BASH_FILES:
    os.system('cp -v ' + REPO_PATH + '/bash/' + i + ' ' + HOME_DIR + '/' + i)
print (' ')

# Copying tmux dot files
print(color.CYAN + '----' + color.RESET)
print(color.CYAN + 'Tmux' + color.RESET)
print(color.CYAN + '----' + color.RESET)
TMUX_CHECK = subprocess.getstatusoutput('which tmux')
if (TMUX_CHECK[0] == 0):
    print(color.GREEN + 'Copying tmux dot files' + color.RESET)
    for i in TMUX_FILES:
        os.system('cp -v ' + REPO_PATH + '/tmux/' + i + ' ' +
                  HOME_DIR + '/' + i)
    print (' ')
    print(color.YELLOW + '** Reminder: Uncomment the appropriate block in ' +
          HOME_DIR + '/.tmux.conf for clipboard integration' + color.RESET)
    # Install tmux plugins
    print('Installing tmux plugins')
    os.system('python3 ' + REPO_PATH + '/tmux/plugin_install.py')
    print (' ')

# Tmux theme files for Linux vs WSL
COLOR_SCHEME = "airline_original"
if (OSTYPE == 'Linux'):
    with open('/proc/version', 'r') as OSVER:
        for line in OSVER:
            if ('windows' in line.lower()):
                print('This is Widows Subsystem for Linux')
                COLOR_SCHEME = "yellow"
            else:
                COLOR_SCHEME = "airline_original"

os.system('cp -v ' + REPO_PATH + '/tmux/themes/' + COLOR_SCHEME +
          '/.tmux* ' + HOME_DIR + '/')

# Copying vim dot files
print(color.CYAN + '---' + color.RESET)
print(color.CYAN + 'Vim' + color.RESET)
print(color.CYAN + '---' + color.RESET)
vim_check = subprocess.getstatusoutput('which vim')
if (vim_check[0] == 0):
    print(color.GREEN + 'Copying vim dot files' + color.RESET)
    for i in VIM_FILES:
        os.system('cp -v ' + REPO_PATH + '/vim/' + i + ' ' +
                  HOME_DIR + '/' + i)
    os.system(REPO_PATH + '/vim/plugin_install.py')

# Copying w3m dot files
w3m_check = subprocess.getstatusoutput('which w3m')
if (w3m_check[0] == 0):
    print(color.GREEN + 'Copying w3m dot file' + color.RESET)
    os.system('cp -vr' + REPO_PATH + '/w3m' + HOME_DIR)
