### Vim/Gvim ###

No longer a vim purist, I now rely on rather lengthy rc files, pathogen and a small collection of plug-ins:

1. [ale](https://github.com/w0rp/ale) - Asyunchronous Linting Engine 
1. [ansible-vim](https://github.com/pearofducks/ansible-vim) - Better syntax highlighting for Anible files
1. [vim-fugitive](https://github.com/tpope/vim-fugitive) - Git Integration 
1. [svnj.vim](https://github.com/juneedahamed/svnj.vim) - Subverision Integration 
1. [vim-minimap](https://github.com/dpc/vim-minimap) - A cool minimap (Sublime envy)
1. [vim-multiple-cursors](https://github.com/terryma/vim-multiple-cursors) - Multiple cursors (ditto) 
1. [vim-ps1](https://github.com/PProvost/vim-ps1) - Windows Powershell syntax 

#### Installation ####

1. Clone this repo
1. Copy (or link) the rc files
1. Run plugin\_install.sh to install pathogen and the plug-ins listed above

e.g.

```shell
cd
git clone https://github.com/V01dDweller/dotfiles
ln -s dotfiles/.vimrc
ln -s dotfiles/.gvimrc
./dotfiles/vim/plugin_install.sh
```
