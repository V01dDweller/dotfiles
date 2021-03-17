#!/bin/bash

# Install/update my favorite plug-ins via pathogen/git

# - Asynchronous Linting Engine    - https://github.com/dense-analysis/ale
# - Ansible syntax highlighting    - https://github.com/pearofducks/ansible-vim
# - AnsiEsc                        - https://github.com/vim-scripts/AnsiEsc.vim
# - Colorize HTML color codes      - https://github.com/chrisbra/Colorizer
# - Delete saved views             - https://github.com/vim-scripts/delview
# - Fugitive                       - https://github.com/tpope/vim-fugitive
# - Git Gutter                     - https://github.com/airblade/vim-gitgutter
# - Nginx conf file syntax         - https://github.com/chr4/nginx.vim
# - PowerShell syntax highlighting - https://github.com/PProvost/vim-ps1
# - Better netrw?                  - https://github.com/tpope/vim-vinegar
# - Dracula color scheme           - https://github.com/dracula/vim
# - Vim airline                    - https://github.com/vim-airline/vim-airline
# - tmuxline                       - https://github.com/edkolev/tmuxline.vim
# - promptline                     - https://github.com/edkolev/promptline.vim
# - vim-surround                   - https://github.com/tpope/vim-surround

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
  vim-airline/vim-airline \
  chrisbra/Colorizer \
  airblade/vim-gitgutter \
  PProvost/vim-ps1 \
  tpope/vim-fugitive\
  tpope/vim-vinegar\
  vim-scripts/delview \
  chr4/nginx.vim \
  dracula/vim \
  edkolev/tmuxline.vim \
  edkolev/promptline.vim \
  tpope/vim-surround
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
      git clone --depth 1 "$URL"
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
  "/gosukiwi/vim-atom-dark/master/colors/atom-dark-256.vim"
  "/baskerville/bubblegum/master/colors/bubblegum-256-dark.vim"
  "/morhetz/gruvbox/master/colors/gruvbox.vim"
  "/micke/vim-hybrid/master/colors/hybrid.vim"
  "/tomasr/molokai/master/colors/molokai.vim"
  "/jalvesaq/southernlights/master/colors/southernlights.vim"
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
