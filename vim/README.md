Vim/gVim
========

The `plugin_install` scripts install the Pathogen plug-in manager, a collection of plug-ins and a handful of color schemes to your `~/.vim` directory.

Plug-ins
--------

1. [ALE](https://github.com/dense-analysis/ale) - Asynchronous Linting Engine
1. [Airline](https://github.com/vim-airline/vim-airline) - Enhanced always on-status line
1. [Airline Themes](https://github.com/vim-airline/vim-airline-themes) - Extra themes for Airline
1. [AnsiEsc](https://github.com/vim-scripts/AnsiEsc.vim) - Convert ASCII escapes to color
1. [Ansible](https://github.com/pearofducks/ansible-vim) - Ansible syntax highlighting
1. [Autosave](https://github.com/907th/vim-auto-save) - Auto save
1. [Colorizer](https://github.com/chrisbra/Colorizer) - Colorize HTML/CSS color codes
1. ✲ [Conqueror of Completion (CoC)](https://github.com/neoclide/coc.nvim) - Autocompletion engine for Vim
1. [Delview](https://github.com/vim-scripts/delview) - Delete saved views
1. [Devicons](https://github.com/ryanoasis/vim-devicons) - Fancy icons for NERDTree (Requires a [NERDFont](https://www.nerdfonts.com/))
1. [Dracula](https://github.com/dracula/vim) - Dracula color scheme
1. [Fugitive](https://github.com/tpope/vim-fugitive) - Git integration
1. [Git-Gutter](https://github.com/airblade/vim-gitgutter) - Shows git changes in the gutter
1. ✲ [GitHub Copilot](https://github.com/github/copilot.vim") - GitHub Copilot integration for Vim
1. [HCL](https://github.com/jvirtanen/vim-hcl) - HashiCorp Configuration Language syntax highlighting
1. [Jenkinsfile syntax](https://github.com/martinda/Jenkinsfile-vim-syntax) - Jenkinsfile syntax highlighting
1. [Lion](https://github.com/tommcdo/vim-lion.git) - Aligning text by a character
1. [NERDTree](https://github.com/preservim/nerdtree) - Filesystem Explorer
1. [Nginx.vim](https://github.com/chr4/nginx.vim) - Nginx conf file syntax
1. [PS1](https://github.com/PProvost/vim-ps1) - PowerShell syntax highlighting
1. [Promptline](https://github.com/edkolev/promptline.vim) - Bash prompt sync with Airline
1. [Repeat](https://github.com/tpope/vim-repeat) - Repeat plug-in remaps like Vim-Surround
1. [Surround.vim](https://github.com/tpope/vim-surround) - Quickly change "surroundings"
1. [Tmuxline](https://github.com/edkolev/tmuxline.vim) - Tmux theme sync with Airline
1. [Vinegar](https://github.com/tpope/vim-vinegar) - Better netrw?

✲ NodeJS v22.x(LTS) is required for CoC and GitHub Copilot. These will be skipped if NodeJS is not installed or in the `PATH`.

Color Schemes
-------------

1. atom-dark-256
1. bubblegum-256-dark
1. gruvbox
1. hybrid
1. molokai
1. southernlights
1. xoria256

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
