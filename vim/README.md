### Vim/Gvim ###

No longer a vim purist, I now rely on rather lengthy rc files, pathogen and a small collection of plug-ins:

1. [ale](https://github.com/w0rp/ale) - Asynchronous Linting Engine 
1. [AnsiEsc](https://github.com/vim-scripts/AnsiEsc.vim) - Converts ascii color escapes back into color
1. [Colorizer](https://github.com/chrisbra/Colorizer) - Colorizes HTML color codes
1. [ansible-vim](https://github.com/pearofducks/ansible-vim) - Better syntax highlighting for Anible files
1. [vim-fugitive](https://github.com/tpope/vim-fugitive) - Git Integration 
1. [svnj.vim](https://github.com/juneedahamed/svnj.vim) - Subverision Integration 
1. [vim-minimap](https://github.com/dpc/vim-minimap) - A cool minimap (Sublime envy)
1. [vim-multiple-cursors](https://github.com/terryma/vim-multiple-cursors) - Multiple cursors (ditto) 
1. [vim-ps1](https://github.com/PProvost/vim-ps1) - Windows Powershell syntax
1. [vim-256-colors](https://github.com/noah/vim256-color) - Way too many color schemes

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
./dotfiles/vim/plugin_install.sh
```
