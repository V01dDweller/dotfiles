#!/usr/bin/env python3
""" Set up Pathogen and install Vim plugins """

# - Asynchronous Linting Engine    - https://github.com/dense-analysis/ale
# - Ansible syntax highlighting    - https://github.com/pearofducks/ansible-vim
# - AnsiEsc                        - https://github.com/vim-scripts/AnsiEsc.vim
# - Colorize HTML color codes      - https://github.com/chrisbra/Colorizer
# - Delete saved views             - https://github.com/vim-scripts/delview
# - Fugitive                       - https://github.com/tpope/vim-fugitive
# - Git Gutter                     - https://github.com/airblade/vim-gitgutter
# - Nginx conf file syntax         - https://github.com/chr4/nginx.vim
# - PowerShell syntax highlighting - https://github.com/PProvost/vim-ps1
# - Better netrw?                  - https://github.com/tpope/vim-vinegar
# - Dracula color scheme           - https://github.com/dracula/vim
# - Vim airline                    - https://github.com/vim-airline/vim-airline
# - tmuxline                       - https://github.com/edkolev/tmuxline.vim
# - promptline                     - https://github.com/edkolev/promptline.vim
# - vim-surround                   - https://github.com/tpope/vim-surround

import os
import urllib.request


class color:
    RED = '\u001b[31;1m'
    GREEN = '\u001b[32;1m'
    YELLOW = '\u001b[33;1m'
    BLUE = '\u001b[34;1m'
    MAGENTA = '\u001b[35;1m'
    CYAN = '\u001b[36;1m'
    WHITE = '\u001b[37;1m'
    RESET = '\u001b[0m'

# Creating ~/.vim
HOME_DIR = os.environ['HOME']
VIM_DIR = (HOME_DIR + '/.vim')
if not os.path.exists(VIM_DIR):
    print('Creating ' + color.CYAN + VIM_DIR + color.RESET + '\n')
    os.mkdir(VIM_DIR)
else:
    print(color.CYAN + VIM_DIR + color.RESET + ' already exists\n')

# Installing the Pathogen plugn-in manager
PATHOGEN_DIRS = ['autoload', 'bundle']
PATHOGEN_PLUGIN_FILE = (VIM_DIR + '/autoload/pathogen.vim')
PATHOGEN_URL = ('https://raw.githubusercontent.com' +
                '/tpope/vim-pathogen/master/autoload/pathogen.vim')

print('Creating Pathogen directories')
for i in PATHOGEN_DIRS:
    PLUGIN_PATH = (VIM_DIR + '/' + i)
    if not os.path.exists(PLUGIN_PATH):
        print('Creating ' + color.CYAN + PLUGIN_PATH + color.RESET)
        os.mkdir(PLUGIN_PATH)
    else:
        print(color.CYAN + PLUGIN_PATH + color.RESET +
              ' already exists\n' + color.RESET)

if not os.path.exists(PATHOGEN_PLUGIN_FILE):
    print('Installing Pathogen to ' +
          color.CYAN + PATHOGEN_PLUGIN_FILE + color.RESET)
    urllib.request.urlretrieve(PATHOGEN_URL, PATHOGEN_PLUGIN_FILE)
else:
    print(color.CYAN + PATHOGEN_PLUGIN_FILE + color.RESET +
          ' already downloaded\n' + color.RESET)

# Installing/Updating plug-ins
VIM_PLUGINS = [
    'dense-analysis/ale',
    'vim-scripts/AnsiEsc.vim',
    'pearofducks/ansible-vim',
    'vim-airline/vim-airline',
    'chrisbra/Colorizer',
    'airblade/vim-gitgutter',
    'PProvost/vim-ps1',
    'tpope/vim-fugitive',
    'tpope/vim-vinegar',
    'chr4/nginx.vim',
    'vim-scripts/delview',
    'dracula/vim'
    'edkolev/tmuxline.vim',
    'edkolev/promptline.vim',
    'tpope/vim-surround'
    ]
BUNDLE_DIR = (VIM_DIR + '/bundle')
START_DIR = (os.getcwd())

print('Plugins will be installed in ' + color.CYAN +
      BUNDLE_DIR + '\n' + color.RESET)

if os.path.exists(BUNDLE_DIR):
    for i in VIM_PLUGINS:
        REPO_PARTS = i.split('/')
        os.chdir(BUNDLE_DIR)
        if not os.path.exists(REPO_PARTS[1]):
            PLUGIN_REPO = ('https://github.com/'+i+'.git')
            print('Checking out ' + color.GREEN + PLUGIN_REPO + color.RESET)
            os.system('git clone --depth 1 ' + PLUGIN_REPO)
            print(" ")
        else:
            print('Checking for updates to ' + color.GREEN +
                  REPO_PARTS[1] + color.RESET)
            os.chdir(REPO_PARTS[1])
            os.system('git pull')
            print(' ')
    os.chdir(START_DIR)

# Install colorschemes from Github
COLOR_DIR = (VIM_DIR + '/colors')
if not os.path.exists(COLOR_DIR):
    print('Creating ' + color.CYAN + COLOR_DIR + color.RESET + '\n')
    os.mkdir(COLOR_DIR)

COLOR_SCHEMES = [
    '/gosukiwi/vim-atom-dark/master/colors/atom-dark-256.vim',
    '/baskerville/bubblegum/master/colors/bubblegum-256-dark.vim',
    '/morhetz/gruvbox/master/colors/gruvbox.vim',
    '/micke/vim-hybrid/master/colors/hybrid.vim',
    '/tomasr/molokai/master/colors/molokai.vim',
    '/jalvesaq/southernlights/master/colors/southernlights.vim',
    '/vim-scripts/xoria256.vim/master/colors/xoria256.vim'
    ]

print(color.MAGENTA + 'Updating color schemes' + color.RESET)
for i in COLOR_SCHEMES:
    COLOR_FILE = os.path.basename(i)
    COLOR_PATH = (COLOR_DIR + '/' + COLOR_FILE)
    if not os.path.exists(COLOR_PATH):
        print('Downloading ' + color.GREEN + COLOR_FILE + color.RESET)
        COLOR_URL = ('https://raw.githubusercontent.com'+i)
        urllib.request.urlretrieve(COLOR_URL, COLOR_PATH)
