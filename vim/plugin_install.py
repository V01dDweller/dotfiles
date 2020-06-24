#!/usr/bin/env python3
""" Set up Pathogen and install my Vim plugins """

# Install/update my favorite plug-ins via pathogen/git

# - Asynchronous Linting Engine    - https://github.com/dense-analysis/ale
# - Ansible syntax highlighting    - https://github.com/pearofducks/ansible-vim
# - Convert ASCII escapes to color - https://github.com/vim-scripts/AnsiEsc.vim
# - Colorize HTML color codes      - https://github.com/chrisbra/Colorizer
# - Delete saved views             - https://github.com/vim-scripts/delview
# - Git integration                - https://github.com/tpope/vim-fugitive
# - Shows a git diff in the gutter - https://github.com/airblade/vim-gitgutter
# - Nginx conf file syntax         - https://github.com/chr4/nginx.vim
# - Autoswitch number modes        - https://github.com/jeffkreeftmeijer/vim-numbertoggle
# - PowerShell syntax highlighting - https://github.com/PProvost/vim-ps1
# - Better netrw?                  - https://github.com/tpope/vim-vinegar
# - Dracula color scheme           - https://github.com/dracula/vim

import os
import urllib.request

# Thanks to
#    http://www.lihaoyi.com/post/BuildyourownCommandLinewithANSIescapecodes.html

# Output Colors
BLACK = '\u001b[30m'
RED = '\u001b[31m'
GREEN = '\u001b[32m'
YELLOW = '\u001b[33m'
BLUE = '\u001b[34m'
MAGENTA = '\u001b[35m'
CYAN = '\u001b[36m'
WHITE = '\u001b[37m'
RESET = '\u001b[0m'

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
        'dense-analysis/ale',
        'vim-scripts/AnsiEsc.vim',
        'pearofducks/ansible-vim',
        'chrisbra/Colorizer',
        'airblade/vim-gitgutter',
        'PProvost/vim-ps1',
        'tpope/vim-fugitive',
        'tpope/vim-vinegar',
        'chr4/nginx.vim',
        'vim-scripts/delview',
        'jeffkreeftmeijer/vim-numbertoggle',
        'dracula/vim'
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

# Install colorschemes from Github
COLOR_DIR = (VIM_DIR + '/colors')
if not os.path.exists(COLOR_DIR):
    print('Creating ' + CYAN + COLOR_DIR + RESET + '\n')
    os.mkdir(COLOR_DIR)

COLOR_SCHEMES = [
    '/baskerville/bubblegum/master/colors/bubblegum-256-dark.vim',
    '/gosukiwi/vim-atom-dark/master/colors/atom-dark-256.vim',
    '/jalvesaq/southernlights/master/colors/southernlights.vim',
    '/micke/vim-hybrid/master/colors/hybrid.vim',
    '/morhetz/gruvbox/master/colors/gruvbox.vim',
    '/tomasr/molokai/master/colors/molokai.vim',
    '/vim-scripts/xoria256.vim/master/colors/xoria256.vim'
    ]

print(MAGENTA + 'Updating color schemes' + RESET)
for i in COLOR_SCHEMES:
    COLOR_FILE = os.path.basename(i)
    COLOR_PATH = (COLOR_DIR + '/' + COLOR_FILE)
    if not os.path.exists(COLOR_PATH):
        print('Downloading ' + GREEN + COLOR_FILE + RESET)
        COLOR_URL = ('https://raw.githubusercontent.com'+i)
        urllib.request.urlretrieve(COLOR_URL, COLOR_PATH)
