Vim/gVim
========

The plugin\_install script installs the Pathogen plug-in manager, a collection
of plug-ins and a handful of color schemes:

Plug-ins
--------

 1. [ALE](https://github.com/w0rp/ale) - Asynchronous Linting Engine
 2. [ansible](https://github.com/pearofducks/ansible-vim) - Ansible syntax highlighting
 3. [AnsiEsc](https://github.com/vim-scripts/AnsiEsc.vim) - Convert ASCII escapes to color
 4. [Airline](https://github.com/vim-airline/vim-airline) - Enhanced always on-status line
 5. [Colorizer](https://github.com/chrisbra/Colorizer) - Colorize HTML/CSS color codes
 6. [Delview](https://github.com/vim-scripts/delview) - Delete saved views
 7. [Fugitive](https://github.com/tpope/vim-fugitive) - Git integration
 8. [git-gutter](https://github.com/airblade/vim-gitgutter) - Shows git changes in the gutter
 9. [PS1](https://github.com/PProvost/vim-ps1) - PowerShell syntax highlighting
10. [vim256](https://github.com/noah/vim256-color) - Too many color schemes
11. [Vinegar](https://github.com/tpope/vim-vinegar) - Better netrw?
12. [Dracula](https://github.com/dracula/vim) - Dracula color scheme

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
