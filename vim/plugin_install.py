#!/usr/bin/python
import os

pathogen_dirs = [ "autoload", "bundle" ]
for i in pathogen_dirs:
    vim_path = ( os.path.expanduser('~') + "/.vim/" + i )
    if not os.path.exists(vim_path):
        print(os.path.exists(vim_path))

vim_plugins = [
                "w0rp/ale",
                "vim-scripts/AnsiEsc.vim",
                "pearofducks/ansible-vim",
                "chrisbra/Colorizer",
                "airblade/vim-gitgutter",
                "dpc/vim-minimap",
                "PProvost/vim-ps1",
                "tpope/vim-fugitive,",
                "tpope/vim-vinegar,",
                "juneedahamed/svnj.vim",
                "vim-scripts/delview "
              ]

