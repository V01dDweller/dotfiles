#!/bin/bash

# Re-install my favorite plug-ins via pathogen
#  ale                  - https://github.com/w0rp/ale                      
#  vim256-color         - https://github.com/noah/vim256-color             
#  vim-fugitive         - https://github.com/tpope/vim-fugitive
#  vim-minimap          - https://github.com/dpc/vim-minimap.git           
#  vim-multiple-cursors - https://github.com/terryma/vim-multiple-cursors  
#  vim-ps1              - https://github.com/PProvost/vim-ps1              

# Install pathogen
if [ ! -d ~/.vim/autoload ]
then
  mkdir -pv ~/.vim/autoload
fi 

if [ ! -d ~/.vim/bundle ]
then
  mkdir -pv ~/.vim/bundle
fi

export PLUGINS="w0rp/ale terryma/vim-multiple-cursors dpc/vim-minimap PProvost/vim-ps1 tpope/vim-fugitive"

if [ ! -f ~/.vim/autoload/pathogen.vim ]
then
  echo "Installing pathogen"
  curl -LSso ~/.vim/autoload/pathogen.vim https://raw.githubusercontent.com/tpope/vim-pathogen/master/autoload/pathogen.vim
  echo " "
else
  echo "Pathogen is already installed"
  echo " "
fi

if [ -d ~/.vim/bundle ]
then
  cd ~/.vim/bundle
  for i in $PLUGINS
  do
    export PLUGIN_DIR="`echo $i | cut -d '/' -f 2`"
    if [ ! -d $PLUGIN_DIR ];then
      echo "Installing" $PLUGIN_DIR
      git clone https://github.com/$i.git
      echo " "
    else
      echo "Updating " $PLUGIN_DIR
      cd $PLUGIN_DIR
      git pull
      cd ..
      echo " "
    fi
  done
  if [ ! -d ~/.vim/bundle/vim256-color ]
  then
    echo "Installing vim256-color, this could take a minute..."
    git clone --recursive git://github.com/noah/vim256-color.git
    echo ""
  else
    echo "Updating vim2560color"
    cd vim256-color
    git pull
    cd ..
    echo " "
  fi
fi
