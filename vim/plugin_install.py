#!/usr/bin/env python3
""" Set up Pathogen and install my Vim plugins """

# Install/update my favorite plug-ins via pathogen/git

#  ALE               - Asynchronous Linting Engine    - https://github.com/w0rp/ale
#  ansible-vim       - Ansible syntax highlighting    - https://github.com/pearofducks/ansible-vim
#  AnsiEsc           - Convert ASCII escapes to color - https://github.com/vim-scripts/AnsiEsc.vim
#  Colorizer         - Colorize HTML color codes      - https://github.com/chrisbra/Colorizer
#  git-gutter        - Shows a git diff in the gutter - https://github.com/airblade/vim-gitgutter
#  Minimap           - A Sublime-like minimap         - https://github.com/dpc/vim-minimap
#  PS1               - PowerShell syntax highlighting - https://github.com/PProvost/vim-ps1
#  Fugitive          - Git integration                - https://github.com/tpope/vim-fugitive
#  SVNJ              - SVN integration                - https://github.com/juneedahamed/svnj.vim
#  Delview           - Delete saved views             - https://github.com/vim-scripts/delview
#  Vinegar           - Better netrw?                  - https://github.com/tpope/vim-vinegar
#  vim256-color      - Too many color schemes         - https://github.com/noah/vim256-color

import os
import urllib.request

# Thanks to
#    http://www.lihaoyi.com/post/BuildyourownCommandLinewithANSIescapecodes.html

# Output Colors
BLACK='\u001b[30m'
RED='\u001b[31m'
GREEN='\u001b[32m'
YELLOW='\u001b[33m'
BLUE='\u001b[34m'
MAGENTA='\u001b[35m'
CYAN='\u001b[36m'
WHITE='\u001b[37m'
RESET='\u001b[0m'

# Creating ~/.vim
HOME_DIR = os.environ['HOME']
VIM_DIR = (HOME_DIR + '/.vim')
if not os.path.exists(VIM_DIR):
    print('Creating ' + CYAN + VIM_DIR + RESET + '\n')
    os.mkdir(VIM_DIR)
else:
    print(CYAN + VIM_DIR + RESET + ' already exists\n')

# Installing the Pathogen plugn-in manager
PATHOGEN_DIRS = ['autoload', 'bundle']
PATHOGEN_PLUGIN_FILE = (VIM_DIR + '/autoload/pathogen.vim')
PATHOGEN_URL = 'https://raw.githubusercontent.com/tpope/vim-pathogen/master/autoload/pathogen.vim'

print('Creating Pathogen directories')
for i in PATHOGEN_DIRS:
    PLUGIN_PATH = (VIM_DIR + '/' + i)
    if not os.path.exists(PLUGIN_PATH):
        print('Creating ' + CYAN + PLUGIN_PATH + RESET)
        os.mkdir(PLUGIN_PATH)
    else:
        print(CYAN + PLUGIN_PATH + RESET + ' already exists\n' + RESET)

if not os.path.exists(PATHOGEN_PLUGIN_FILE):
    print('Installing Pathogen to ' + CYAN + PATHOGEN_PLUGIN_FILE + RESET)
    urllib.request.urlretrieve(PATHOGEN_URL, PATHOGEN_PLUGIN_FILE)
else:
    print(CYAN + PATHOGEN_PLUGIN_FILE + RESET + ' already downloaded\n' + RESET)

# Installing/Updating plug-ins
VIM_PLUGINS = [
        'w0rp/ale',
        'vim-scripts/AnsiEsc.vim',
        'pearofducks/ansible-vim',
        'chrisbra/Colorizer',
        'airblade/vim-gitgutter',
        'dpc/vim-minimap',
        'PProvost/vim-ps1',
        'tpope/vim-fugitive',
        'tpope/vim-vinegar',
        'juneedahamed/svnj.vim',
        'vim-scripts/delview'
        ]
BUNDLE_DIR = (VIM_DIR + '/bundle')
START_DIR = (os.getcwd())

print('Plugins will be installed in ' + CYAN + BUNDLE_DIR + '\n' + RESET)

if os.path.exists(BUNDLE_DIR):
    for i in VIM_PLUGINS:
        REPO_PARTS = i.split('/')
        os.chdir(BUNDLE_DIR)
        if not os.path.exists(REPO_PARTS[1]):
            PLUGIN_REPO = ('https://github.com/'+i+'.git')
            print('Checking out ' + GREEN + PLUGIN_REPO + RESET)
            os.system('git clone ' + PLUGIN_REPO)
            print(" ")
        else:
            print('Checking for updates to ' + GREEN + REPO_PARTS[1] + RESET)
            os.chdir(REPO_PARTS[1])
            os.system('git pull')
            print(' ')
    os.chdir(START_DIR)

# Install vim256-color colorschemes
COLOR_DIR = (BUNDLE_DIR + '/vim256-color')
DESIRE_COLORS = ''
PROMT_FOR_COLOR = 'Install Vim color schemes?  (skip if you\'re in a hurry) (y/n): '
while DESIRE_COLORS not in ('Y', 'y', 'N', 'n'):
    DESIRE_COLORS = input(YELLOW + PROMT_FOR_COLOR + RESET)
    if DESIRE_COLORS in ('Y', 'y'):
        os.chdir(BUNDLE_DIR)
        print('Yay! Color!\n')
        if not os.path.exists(COLOR_DIR):
            print('Cloning color schemes, this will take some time...')
            os.system('git clone --recursive git://github.com/noah/vim256-color.git ')
        else:
            print('Colors already installed, updating...')
            os.chdir(COLOR_DIR)
            os.system('git pull')
    elif DESIRE_COLORS in ('N', 'n'):
        print('Another time, perhaps')
        break
    else:
        print(YELLOW + 'Please answer "y" or "n"' + RESET)
    os.chdir(START_DIR)
