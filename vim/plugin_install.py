#!/usr/bin/env python3
""" Set up Pathogen and install Vim plugins """

# - ALE                            - https://github.com/dense-analysis/ale
# - Airline                        - https://github.com/vim-airline/vim-airline
# - AnsiEsc                        - https://github.com/vim-scripts/AnsiEsc.vim
# - Ansible syntax highlighting    - https://github.com/pearofducks/ansible-vim
# - Colorizer                      - https://github.com/chrisbra/Colorizer
# - Delview                        - https://github.com/vim-scripts/delview
# - Dracula color scheme           - https://github.com/dracula/vim
# - Fugitive                       - https://github.com/tpope/vim-fugitive
# - Git Gutter                     - https://github.com/airblade/vim-gitgutter
# - Nginx conf file syntax         - https://github.com/chr4/nginx.vim
# - PS1 syntax for PowerShell      - https://github.com/PProvost/vim-ps1
# - Promptline                     - https://github.com/edkolev/promptline.vim
# - Surround.vim                   - https://github.com/tpope/vim-surround
# - Tmuxline                       - https://github.com/edkolev/tmuxline.vim
# - Vinegar                        - https://github.com/tpope/vim-vinegar

import os
import urllib.request


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

# Creating ~/.vim
HOME_DIR = os.environ['HOME']
VIM_DIR = (HOME_DIR + '/.vim')
if not os.path.exists(VIM_DIR):
    print('Creating ' + COLOR["cyan"] + VIM_DIR + COLOR["reset"] + '\n')
    os.mkdir(VIM_DIR)
else:
    print(COLOR["cyan"] + VIM_DIR + COLOR["reset"] + ' already exists\n')

# Installing the Pathogen plugn-in manager
PATHOGEN_DIRS = ['autoload', 'bundle']
PATHOGEN_PLUGIN_FILE = (VIM_DIR + '/autoload/pathogen.vim')
PATHOGEN_URL = ('https://raw.githubusercontent.com' +
                '/tpope/vim-pathogen/master/autoload/pathogen.vim')

print('Creating Pathogen directories')
for i in PATHOGEN_DIRS:
    PLUGIN_PATH = (VIM_DIR + '/' + i)
    if not os.path.exists(PLUGIN_PATH):
        print('Creating ' + COLOR["cyan"] + PLUGIN_PATH + COLOR["reset"])
        os.mkdir(PLUGIN_PATH)
    else:
        print(COLOR["cyan"] + PLUGIN_PATH + COLOR["reset"] +
              ' already exists\n' + COLOR["reset"])

if not os.path.exists(PATHOGEN_PLUGIN_FILE):
    print('Installing Pathogen to ' +
          COLOR["cyan"] + PATHOGEN_PLUGIN_FILE + COLOR["reset"])
    urllib.request.urlretrieve(PATHOGEN_URL, PATHOGEN_PLUGIN_FILE)
else:
    print(COLOR["cyan"] + PATHOGEN_PLUGIN_FILE + COLOR["reset"] +
          ' already downloaded\n' + COLOR["reset"])

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

print('Plugins will be installed in ' + COLOR["cyan"] +
      BUNDLE_DIR + '\n' + COLOR["reset"])

if os.path.exists(BUNDLE_DIR):
    for i in VIM_PLUGINS:
        REPO_PARTS = i.split('/')
        os.chdir(BUNDLE_DIR)
        if not os.path.exists(REPO_PARTS[1]):
            PLUGIN_REPO = ('https://github.com/'+i+'.git')
            print('Checking out ' + COLOR["green"] + PLUGIN_REPO + COLOR["reset"])
            os.system('git clone --depth 1 ' + PLUGIN_REPO)
            print(" ")
        else:
            print('Checking for updates to ' + COLOR["green"] +
                  REPO_PARTS[1] + COLOR["reset"])
            os.chdir(REPO_PARTS[1])
            os.system('git pull')
            print(' ')
    os.chdir(START_DIR)

# Install colorschemes from Github
COLOR_DIR = (VIM_DIR + '/colors')
if not os.path.exists(COLOR_DIR):
    print('Creating ' + COLOR["cyan"] + COLOR_DIR + COLOR["reset"] + '\n')
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

print(COLOR["magenta"] + 'Updating color schemes' + COLOR["reset"])
for i in COLOR_SCHEMES:
    COLOR_FILE = os.path.basename(i)
    COLOR_PATH = (COLOR_DIR + '/' + COLOR_FILE)
    if not os.path.exists(COLOR_PATH):
        print('Downloading ' + COLOR["green"] + COLOR_FILE + COLOR["reset"])
        COLOR_URL = ('https://raw.githubusercontent.com'+i)
        urllib.request.urlretrieve(COLOR_URL, COLOR_PATH)
