#!/usr/bin/python3

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

import sys
import os
import urllib.request

# Creating ~/.vim
HOME_DIR = os.environ['HOME']
VIM_DIR = (HOME_DIR + '/.vim')
if not os.path.exists(VIM_DIR):
  print('Creating ' + VIM_DIR)
  os.mkdir(VIM_DIR)
else:
  print(VIM_DIR + ' already exists')

# Installing the Pathogen plugn-in manager
PATHOGEN_DIRS = [ 'autoload', 'bundle' ]
PATHOGEN_PLUGIN_FILE = (VIM_DIR + '/autoload/pathogen.vim')

for i in PATHOGEN_DIRS:
    PLUGIN_PATH=(VIM_DIR + '/' + i)
    if not os.path.exists(PLUGIN_PATH):
        print('Creating ' + PLUGIN_PATH)
        os.mkdir(PLUGIN_PATH)
    else:
        print(PLUGIN_PATH + ' already exists')

if not os.path.exists(PATHOGEN_PLUGIN_FILE):
    print('Installing Pathogen to ' + PATHOGEN_PLUGIN_FILE)
    urllib.request.urlretrieve('https://raw.githubusercontent.com/tpope/vim-pathogen/master/autoload/pathogen.vim', PATHOGEN_PLUGIN_FILE)
else:
    print(PATHOGEN_PLUGIN_FILE + ' already downloaded')

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
START_DIR=(os.getcwd())

print('Plugins will be installed in ' + BUNDLE_DIR)
print(' ')

if os.path.exists(BUNDLE_DIR):
    for i in VIM_PLUGINS:
        REPO_PARTS = i.split('/')
        os.chdir(BUNDLE_DIR)
        if not os.path.exists(REPO_PARTS[1]):
            PLUGIN_REPO=('https://github.com/'+i+'.git')
            print('Cloning ' + PLUGIN_REPO)
            os.system('git clone ' + PLUGIN_REPO)
            print(" ")
        else:
            print('Checking for updates to ' + REPO_PARTS[1])
            os.chdir(REPO_PARTS[1])
            os.system('git pull')
            print(' ')
    os.chdir(START_DIR)

COLOR_DIR=(VIM_DIR + '/vim256-colors')
DESIRE_COLORS=''
while DESIRE_COLORS not in ('Y', 'y', 'N', 'n'):
    DESIRE_COLORS=input('Install Vim color schemes? (skip if you\'re in a hurry) (y/n): ')
    if DESIRE_COLORS in ('Y', 'y'):
        os.chdir(BUNDLE_DIR)
        print('Yay! Color!')
        if not os.path.exists(COLOR_DIR):
            os.system('git clone --recursive git://github.com/noah/vim256-color.git ')
        else:
            print('Colors already installed, updating...')
            os.chdir(BUNDLE_DIR + 'vim256-color')
            os.system('git pull')
        break
    elif DESIRE_COLORS in ('N', 'n'):
        print('Another time, perhaps')
        break
    else:
        print('Please answer "y" or "n"')
    os.chdir(START_DIR)
