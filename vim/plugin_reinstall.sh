#!/bin/bash

# Re-install my favorite plug-ins for pathogen
#  ale                  - https://github.com/w0rp/ale                      
#  vim256-color         - https://github.com/noah/vim256-color             
#  vim-fugitive         - https://github.com/tpope/vim-fugitive
#  vim-minimap          - https://github.com/dpc/vim-minimap.git           
#  vim-multiple-cursors - https://github.com/terryma/vim-multiple-cursors  
#  vim-ps1              - https://github.com/PProvost/vim-ps1              

if [ -d ~/.vim/bindle ]; then
  cd ~/.vim/bundle
  for i in w0rp/ale terryma/vim-multiple-cursors dpc/vim-minimap PProvost/vim-ps1 tpope/vim-fugitive
  do
    git clone https://github.com/$i.git
  done
  git clone --recursive git://github.com/noah/vim256-color.git
fi
