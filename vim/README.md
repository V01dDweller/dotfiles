Vim/gVim
========

The plugin\_install script installs the Pathogen plug-in manager, a collection
of plug-ins and a handful of color schemes:

Plug-ins
--------

1. [ALE](https://github.com/dense-analysis/ale) - Asynchronous Linting Engine
1. [Airline](https://github.com/vim-airline/vim-airline) - Enhanced always on-status line
1. [AnsiEsc](https://github.com/vim-scripts/AnsiEsc.vim) - Convert ASCII escapes to color
1. [Ansible](https://github.com/pearofducks/ansible-vim) - Ansible syntax highlighting
1. [Colorizer](https://github.com/chrisbra/Colorizer) - Colorize HTML/CSS color codes
1. [Delview](https://github.com/vim-scripts/delview) - Delete saved views
1. [Dracula](https://github.com/dracula/vim) - Dracula color scheme
1. [Fugitive](https://github.com/tpope/vim-fugitive) - Git integration
1. [Git-Gutter](https://github.com/airblade/vim-gitgutter) - Shows git changes in the gutter
1. [Nginx.vim](https://github.com/chr4/nginx.vim) - Nginx conf file syntax
1. [PS1](https://github.com/PProvost/vim-ps1) - PowerShell syntax highlighting
1. [Promptline](https://github.com/edkolev/promptline.vim) - Bash prompt sync with Airline
1. [Surround.vim](https://github.com/tpope/vim-surround) - Quickly change "surroundings"
1. [Tmuxline](https://github.com/edkolev/tmuxline.vim) - Tmux theme sync with Airline
1. [Vinegar](https://github.com/tpope/vim-vinegar) - Better netrw?

Color Schemes
-------------

1. atom-dark-256
2. bubblegum-256-dark
3. gruvbox
4. hybrid
5. molokai
6. southernlights
7. xoria256

Installation
------------

1. Clone this repo
2. Copy (or link) the rc files
3. Run plugin\_install.sh to install pathogen and the plug-ins listed above

e.g.

```shell
cd
git clone https://github.com/V01dDweller/dotfiles.git
ln -s dotfiles/.vimrc
ln -s dotfiles/.gvimrc
```

...or...

```
./dotfiles/vim/plugin_install.sh
```
