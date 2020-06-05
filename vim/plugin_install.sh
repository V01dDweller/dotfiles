#!/bin/bash

# Install/update my favorite plug-ins via pathogen/git

#  ALE               - Asynchronous Linting Engine    - https://github.com/dense-analysis/ale
#  ansible-vim       - Ansible syntax highlighting    - https://github.com/pearofducks/ansible-vim
#  AnsiEsc           - Convert ASCII escapes to color - https://github.com/vim-scripts/AnsiEsc.vim
#  Colorizer         - Colorize HTML color codes      - https://github.com/chrisbra/Colorizer
#  Delview           - Delete saved views             - https://github.com/vim-scripts/delview
#  Fugitive          - Git integration                - https://github.com/tpope/vim-fugitive
#  git-gutter        - Shows a git diff in the gutter - https://github.com/airblade/vim-gitgutter
#  nginx.vim         - Nginx conf file syntax         - https://github.com/chr4/nginx.vim
#  numbertoggle       - Autoswitch number modes        - https://github.com/jeffkreeftmeijer/vim-numbertoggle
#  PS1               - PowerShell syntax highlighting - https://github.com/PProvost/vim-ps1
#  Vinegar           - Better netrw?                  - https://github.com/tpope/vim-vinegar

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
  PProvost/vim-ps1 \
  tpope/vim-fugitive\
  tpope/vim-vinegar\
  vim-scripts/delview \
  chr4/nginx.vim \
  jeffkreeftmeijer/vim-numbertoggle \
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
fi

# Install colorschemes from Github
if [ ! -d ~/.vim/colors ]
then
  echo "Creating ~/.vim/colors"
  mkdir ~/.vim/colors
fi

COLOR_SCHEMES=(
  "/baskerville/bubblegum/master/colors/bubblegum-256-dark.vim"
  "/dracula/vim/master/colors/dracula.vim"
  "/gosukiwi/vim-atom-dark/master/colors/atom-dark-256.vim"
  "/jalvesaq/southernlights/master/colors/southernlights.vim"
  "/micke/vim-hybrid/master/colors/hybrid.vim"
  "/morhetz/gruvbox/master/colors/gruvbox.vim"
  "/tomasr/molokai/master/colors/molokai.vim"
  "/vim-scripts/xoria256.vim/master/colors/xoria256.vim"
  )

for i in "${COLOR_SCHEMES[@]}"
do
  COLOR_FILE=$(basename "$i")
  if [ ! -f "$HOME"/.vim/colors/"$COLOR_FILE" ]
  then
    echo "Retrieving $COLOR_FILE"
    curl -s -o "$HOME"/.vim/colors/"$COLOR_FILE" https://raw.githubusercontent.com"$i"
  fi
done
