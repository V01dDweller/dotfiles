#!/bin/bash

# Install/update my favorite plug-ins via pathogen/git

#  ALE               - Asynchronous Linting Engine    - https://github.com/dense-analysis/ale
#  ansible-vim       - Ansible syntax highlighting    - https://github.com/pearofducks/ansible-vim
#  AnsiEsc           - Convert ASCII escapes to color - https://github.com/vim-scripts/AnsiEsc.vim
#  Colorizer         - Colorize HTML color codes      - https://github.com/chrisbra/Colorizer
#  git-gutter        - Shows a git diff in the gutter - https://github.com/airblade/vim-gitgutter
#  Minimap           - A Sublime-like minimap         - https://github.com/dpc/vim-minimap
#  nginx.vim         - Nginx conf file syntax         - https://github.com/chr4/nginx.vim
#  PS1               - PowerShell syntax highlighting - https://github.com/PProvost/vim-ps1
#  Fugitive          - Git integration                - https://github.com/tpope/vim-fugitive
#  SVNJ              - SVN integration                - https://github.com/juneedahamed/svnj.vim
#  Delview           - Delete saved views             - https://github.com/vim-scripts/delview
#  Vinegar           - Better netrw?                  - https://github.com/tpope/vim-vinegar
#  vim256-color      - Too many color schemes         - https://github.com/noah/vim256-color


# Bash scripting tweaks credit:
#   https://vaneyckt.io/posts/safer_bash_scripts_with_set_euxo_pipefail
set -Eeuo pipefail

# Install the Pathogen plug-in manager
export PATHOGEN_DIRS="autoload bundle"
for i in $PATHOGEN_DIRS
do
  if [ ! -d ~/.vim/"$i" ]
  then
    export DIR=~/.vim/$i
    echo "Creating" "$DIR"
    mkdir -p "$DIR"
  fi
done

if [ ! -f ~/.vim/autoload/pathogen.vim ]
then
  echo "Installing pathogen"
  cd ~/.vim/autoload
  curl -O https://raw.githubusercontent.com/tpope/vim-pathogen/master/autoload/pathogen.vim
  echo " "
else
  echo "Pathogen is already installed"
  echo " "
fi

# Install/Update plug-ins
export PLUGINS="\
  dense-analysis/ale \
  vim-scripts/AnsiEsc.vim \
  pearofducks/ansible-vim \
  chrisbra/Colorizer \
  airblade/vim-gitgutter \
  dpc/vim-minimap \
  PProvost/vim-ps1 \
  tpope/vim-fugitive\
  tpope/vim-vinegar\
  juneedahamed/svnj.vim \
  vim-scripts/delview \
  chr4/nginx.vim \
  "

if [ -d ~/.vim/bundle ]
then
  cd ~/.vim/bundle
  for i in $PLUGINS
  do
    PLUGIN_DIR=$(echo "$i" | cut -d '/' -f 2)
    export PLUGIN_DIR
    if [ ! -d "$PLUGIN_DIR" ];then
      echo "Installing" "$PLUGIN_DIR"
      URL=https://github.com/"$i".git
      export URL
      echo "$URL"
      git clone "$URL"
      echo " "
    else
      echo "Updating " "$PLUGIN_DIR"
      cd "$PLUGIN_DIR"
      git pull
      cd ..
      echo " "
    fi
  done

# Install vim256-color colorschemes
  export colors=""
  while [[ ! $colors =~ ([YyNn]) ]]
  do
    echo ""
    read -r -n 1 -p "Install Vim color schemes? (hint: skip if you're in a hurry) (y/n): " colors
    case $colors in
      [Yy]* )
        echo ""
        echo "Got it, installing color schemes"
        if [ ! -d ~/.vim/bundle/vim256-color ]
        then
          echo "Installing vim256-color, this will take a minute..."
          git clone --recursive git://github.com/noah/vim256-color.git
          echo ""
        else
          echo "Updating vim256-color"
          cd vim256-color
          git pull
          cd ..
          echo " "
        fi
        ;;
      [Nn]* )
        echo ""
        echo "No problem, maybe later"
        ;;
      *)
        echo ""
        echo "Press 'y' or 'n'"
    esac
  done
fi
