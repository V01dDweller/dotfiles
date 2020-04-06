### Vim/Gvim ###

The plugin_install scripts install Pathogen and a collection of plug-ins that I find  useful:

1. [ALE](https://github.com/w0rp/ale) - Asynchronous Linting Engine
1. [ansible](https://github.com/pearofducks/ansible-vim) - Ansible syntax highlighting
1. [AnsiEsc](https://github.com/vim-scripts/AnsiEsc.vim) - Convert ASCII escapes to color
1. [Colorizer](https://github.com/chrisbra/Colorizer) - Colorize HTML/CSS color codes
1. [git](https://github.com/airblade/vim-gitgutter) - Shows a git diff in the gutter
1. [Minimap](https://github.com/dpc/vim-minimap) - A Sublime-like minimap
1. [PS1](https://github.com/PProvost/vim-ps1) - PowerShell syntax highlighting
1. [Fugitive](https://github.com/tpope/vim-fugitive) - Git integration
1. [SVNJ](https://github.com/juneedahamed/svnj.vim) - SVN integration
1. [Delview](https://github.com/vim-scripts/delview) - Delete saved views
1. [Vinegar](https://github.com/tpope/vim-vinegar) - Better netrw?
1. [vim256](https://github.com/noah/vim256-color) - Too many color schemes

#### Installation ####

1. Clone this repo
1. Copy (or link) the rc files
1. Run plugin\_install.sh to install pathogen and the plug-ins listed above

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
